package cn.examsys.lrx.service.impl;

import java.lang.reflect.Field;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;
import cn.examsys.common.Conf;
import cn.examsys.common.QuestionListTool;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.PageDaoImpl;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.service.PageService;
import cn.examsys.lrx.vo.QuestionCheckVO;

@Service("pageService")
@Transactional
public class PageServiceImpl implements PageService {
	
	@Autowired
	PageDaoImpl dao;
	
	@Override
	public List<Question> loadQuestionList(int sid) {
		return QuestionListTool.queryQuestionList(dao, sid);
	}

	@Override
	public List<Grade> loadGrades(User sessionUser, int page) {
		try {
			return dao.findByHql("from Grade where userId=? order by sid desc"
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int page) {
		try {
			List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o) "
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.paperRef=? and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{1});
			//c.questionRef=q.sid
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int sid, int page) {
		try {
			/*List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o) "
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.questionRef=q.sid and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid");
			return li;*/
			List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o)"
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.responsibleUser=? and (a.checker!=? or a.checker is NULL) and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{sessionUser.getUserId(), sessionUser.getUserId()});
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Question> searchQuestions(User sessionUser, String type, String key, int page) {
		try {
			type = type==null?"":type;
			key = key==null?"":key;
			List<Question> li = dao.findByHql("from Question where userId=? and (type like ? and title like ?)"
					, new Object[]{sessionUser.getUserId(), "%"+type+"%", "%"+key+"%"}, page);
			QuestionListTool.fillOptionsFromQuestionList(dao, li);
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public int loadSearchQuestionsPage(User sessionUser, String type, String key) {
		try {
			BigInteger bi = dao.findOneBySql("select count(sid) from question_tb where userId=? and (type like ? and title like ?)"
					, new Object[]{sessionUser.getUserId(), "%"+type+"%", "%"+key+"%"});
			return bi.intValue();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Question> loadQuestionList(User sessionUser, int sid) {
		try {
			return QuestionListTool.queryQuestionList(dao, sid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Paper loadPaper(int sid) {
		try {
			return dao.findOneByHql("from Paper where sid=?", new Object[]{sid});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	public boolean saveQuestion(User sessionUser, Question question, List<Option> options) {
		try {
			
			question.setUserId(sessionUser.getUserId());
			question.setTime(Tool.time());
			question.setChoiceCount(options.size());
			
			int qsid = (Integer) dao.saveEntity(question);
			
			for (int i = 0; i < options.size(); i++) {
				options.get(i).setQuestionRef(qsid);
				options.get(i).setTime(Tool.time());
				options.get(i).setType(question.getType());
				dao.saveEntity(options.get(i));
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public List<Question> searchQuestionsHandConstitute(User sessionUser,
			String type, String key, int page) {
		try {
			type = type==null?"":type;
			key = key==null?"":key;
			List<Question> li = dao.findByHql("from Question where (type like ? or title like ?)"
					, new Object[]{"%"+type+"%", "%"+key+"%"}, page);
			QuestionListTool.fillOptionsFromQuestionList(dao, li);
			return li;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public QuestionCheckVO loadQuestionBy(int subjectRef, String type) {
		int oldCount = dao.COUNT_PER_PAGE;
		dao.COUNT_PER_PAGE = 1;
		try {
			QuestionCheckVO v = dao.findOneByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o)"
					+ " from Question q, Answersheet a, Option o"
					+ " where q.sid=a.questionRef and a.optionRef=o.sid"
					+ " and q.subjectRef=? and q.type=? order by RAND()"
					, new Object[]{subjectRef, type});
			List<Option> optLi = dao.findByHql("from Option where questionRef=?"
					, new Object[]{v.getQuestion().getSid()});
			v.getQuestion().setOptions(optLi);
			return v;
		} catch (Exception e) {
			e.printStackTrace();
		}
		dao.COUNT_PER_PAGE = oldCount;
		return null;
	}

	
}
