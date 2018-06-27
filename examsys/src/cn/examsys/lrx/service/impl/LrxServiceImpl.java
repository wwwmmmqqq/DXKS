package cn.examsys.lrx.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.swing.plaf.TextUI;

import org.apache.log4j.helpers.QuietWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Notice;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;
import cn.examsys.common.QLBuilder;
import cn.examsys.common.QuestionListTool;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.LrxService;
import freemarker.template.utility.StringUtil;

@Service("lrxService")
@Transactional
public class LrxServiceImpl implements LrxService {
	@Autowired
	LrxDaoImpl dao;
	
	@Override
	public void testService() {
		
		System.out.println("Service层被调用, lrxDao = " + dao);
		
		dao.testDao();
		
		try {
			System.out.println("adapter >> " + dao);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			List<String> li1 = dao.findBySql("select name from stu_tb", 1);
			System.out.println(Arrays.toString(li1.toArray()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean deleteQuestion(User sessionUser, int sid) {
		try {
			dao.deleteEntity(Question.class, sid);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public boolean editQuestion(User sessionUser, int sid, List<String> fields, List<String> vals) {
		try {
			dao.updateEntity(Question.class, sid, fields.toArray(), vals.toArray());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Subject> loadSubjects() {
		try {
			return dao.findByHql("from Subject");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delPaper(User sessionUser, int sid) {
		try {
			dao.deleteEntity(Paper.class, sid);
			dao.updateByHql("delete Constitute where paperRef=?", new Object[]{sid});
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean invite(User sessionUser, int sid, String text) {
		Exam e = dao.findEntity(Exam.class, sid);
		e.setInvitee(e.getInvitee() + " " + text);
		try {
			dao.updateEntity(e);
			
			//通知
			Notice no = new Notice();
			no.setContent(sessionUser.getCollegeName() + "邀请我校参加考试");
			no.setTime(Tool.time());
			List<String> userIds = dao.findBySql("select userId from user_tb where locate(collegeRef,?)>0 or locate(collegeName, ?)>0"
					, new Object[]{e.getInvitee(), e.getInvitee()});
			if (userIds != null) {
				no.setTargetIds(Arrays.toString(userIds.toArray()));
			}
			
			return true;
		} catch (Exception e1) {
			e1.printStackTrace();
		};
		return false;
	}

	@Override
	public boolean delExam(User sessionUser, int sid) {
		try {
			dao.deleteEntity(Exam.class, sid);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<User> loadUsers(User sessionUser) {
		try {
			return dao.findByHql("from User where collegeRef=?"
					, new Object[]{sessionUser.getCollegeRef()});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Question> searchQuestionsHandConstitute(User sessionUser,
			List<String> keys, List<String> vals, int page) {
		try {
			for (int i = 0; i < vals.size(); i++) {
				if ("".equals(vals.get(i).trim())) {
					vals.set(i, "%");
				} else {
					vals.set(i, "%"+vals.get(i).trim()+"%");
				}
			}
			String hql = QLBuilder.builderHQL(keys, Question.class, QLBuilder.MODE_LIKE, QLBuilder.LOGICAL_AND);
			System.out.println(hql);
			List<Question> li = dao.findByHql(hql, vals.toArray(), page);
			
			QuestionListTool.fillOptionsFromQuestionList(dao, li);
			
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
