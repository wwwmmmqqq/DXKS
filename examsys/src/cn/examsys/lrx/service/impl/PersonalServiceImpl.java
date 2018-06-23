package cn.examsys.lrx.service.impl;

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
	public boolean checkQuestion(String checker, int sid, float scoring,
			String questionType) {
		try {
			dao.updateEntity(Answersheet.class, sid
					, new String[]{"checker", "scoring"}
					, new Object[]{checker, scoring});
			/*dao.updateBySql("update answer_tb set checker=?, scroing=? where sid=?"
					, new Object[]{checker, scoring, sid});*/
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
	
}
