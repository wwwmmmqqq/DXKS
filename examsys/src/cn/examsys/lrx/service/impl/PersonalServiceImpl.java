package cn.examsys.lrx.service.impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Criterion;
import org.hibernate.engine.spi.TypedValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Exam;
import cn.examsys.bean.Grade;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.QLBuilder;
import cn.examsys.common.QuestionListTool;
import cn.examsys.lrx.dao.PersonalDao;
import cn.examsys.lrx.dao.impl.PersonalDaoImpl;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.GradeVO;
import cn.examsys.lrx.vo.HistoryGradeVO;
import cn.examsys.lrx.vo.PersonalHomePageVO;
import cn.examsys.lrx.vo.QuestionCheckVO;

@Service("personalService")
@Transactional
public class PersonalServiceImpl implements PersonalService {
	
	@Autowired
	PersonalDaoImpl dao;

	@Override
	public PersonalHomePageVO searchExamsBy(User sessionUser, String filed, String words) {
		
		return null;
	}
	
	@Override
	public PersonalHomePageVO loadStuIndexDatas(User sessionUser) {
		
		return null;
	}

	@Override
	public List<Grade> loadGradeList(User sessionUser, int page) {
		try {
			return dao.findByHql("from Grade where userId=?"
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updatePsw(User sessionUser, String oldPsw, String newPsw) {
		try {
			User u = dao.findOneByHql("from User where userId=?", new Object[]{sessionUser.getUserId()});
			if (u.getPsw().equals(oldPsw)) {
				u.setPsw(newPsw);
				dao.updateEntity(u);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int page) {
		try {
			List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a) "
					+ " from Question q, Answersheet a, Constitute c where a.questionRef=q.sid"
					+ " and (a.checker!=? and c.responsibleUser=?) and c.questionRef=q.sid"
					, new Object[]{sessionUser.getUserId(), sessionUser.getUserId()});
			for (int i = 0; li!=null && i < li.size(); i++) {
				QuestionCheckVO vo = li.get(i);
				
			}
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<GradeVO> loadHistoryGrades(User sessionUser, int page) {
		try {
			return dao.findByHql("select new cn.examsys.lrx.vo.GradeVO(g, p) from Paper p, Grade g"
					+ " where g.paperRef=p.sid and g.userId=?"
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Exam> loadExams(User sessionUser, int page) {
		try {
			return dao.findByHql("from Exam where locate(?, invitee)>0 or locate(?, invitee)>0"
					, new Object[]{sessionUser.getCollegeName()
							, sessionUser.getCollegeRef()}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean checkQuestion(String checker, int answerSid, float scoring,
			String questionType) {
		try {
			//批改成绩 (修改scoring)
			dao.updateEntity(Answersheet.class, answerSid
					, new String[]{"checker", "scoring"}
					, new Object[]{checker, scoring});
			
			Answersheet a = dao.findEntity(Answersheet.class, answerSid);
			String userId = a.getUserId();
			int paperSid = a.getPaperRef();
			System.out.println("paperSid:" + paperSid);
			/*BigInteger bi = dao.findOneBySql("select count(sid) from answersheet_tb"
					+ " where (checker!=? or checker is NULL) and paperRef=? and userId=?"
					, new Object[]{checker, paperSid, userId});*/
			
			
			Long bi = dao.findOneByHql("select count(c.sid)"
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.responsibleUser=? and (a.checker!=? or a.checker is NULL) and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{checker, checker});
			
			boolean hasQuestionsToCheck = bi != null && bi.intValue()>0;
			System.out.println("hasQuestionsToCheck:" + hasQuestionsToCheck + "," + bi.intValue());
			if (!hasQuestionsToCheck) {
				//如果题目全部都被改完了 则 计算总成绩
				Grade g = dao.findOneByHql("from Grade where paperRef=? and userId=?"
						, new Object[]{paperSid, userId});
				Double totalScoreBi = dao.findOneBySql("select sum(scoring) from answersheet_tb"
						+ "	where paperRef=? and userId=?", new Object[]{paperSid, userId});
				g.setPoint(totalScoreBi.intValue());
				g.setState(1);
				dao.updateEntity(g);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void updateStuInfos(User sessionUser, Object[] fields, Object[] values) {
		try {
			dao.updateEntity(User.class, sessionUser.getUserId()
					, (String[]) fields, values);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String registUser(String userId, String psw, String email) {
		User u = dao.findEntity(User.class, userId);
		if (u == null) {
			User user = new User();
			user.setUserId(userId);
			user.setPsw(psw);
			user.setEmail(email);
			try {
				dao.saveEntity(user);
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
		} else {
			return "exist";
		}
		
	}
	
}
