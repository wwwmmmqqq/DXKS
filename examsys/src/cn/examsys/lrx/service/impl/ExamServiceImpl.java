package cn.examsys.lrx.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Constitute;
import cn.examsys.bean.Exam;
import cn.examsys.bean.Grade;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.Conf;
import cn.examsys.common.QuestionListTool;
import cn.examsys.common.ScoreTool;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.ExamDaoImpl;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.vo.AnswerVO;
import cn.examsys.lrx.vo.GradeVO;
import cn.examsys.lrx.vo.PaperWithExamVO;

@Service("examService")
@Transactional
public class ExamServiceImpl implements ExamService {
	
	@Autowired
	ExamDaoImpl dao;
	/**
	 * 拿到考次列表
	 */
	@Override
	public List<Exam> loadMyExamsList(User sessionUser, int page) {
		try {
			return dao.findByHql("from Exam where invitee=?"
					, new Object[]{sessionUser.getCollegeName()}
					, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 拿到试卷列表
	 */
	@Override
	public List<Paper> loadPapersByExam(User sessionUser, int sid, int page) {
		try {
			return dao.findByHql("from Paper where examRef=?", new Object[]{sid}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 开始考试
	 */
	@Override
	public boolean startExamPaper(User sessionUser, int sid) {
		//TODO 
		
		return false;
	}
	
	@Override
	public List<Question> loadQuestionList(int sid) {
		return QuestionListTool.queryQuestionList(dao, sid);
	}
	
	@Override
	public boolean todo(User sessionUser, int paperSid
			, int questionRef, int optionRef, int trueOrFalse
			, String fillsAnswer, String subjectiveAnswer) {
		Question q;
		try {
			q = dao.findOneByHql("from Question where sid=?", new Object[]{questionRef});
		} catch (Exception e1) {
			e1.printStackTrace();
			return false;
		}
		Answersheet answer = null;
		if (q.getType().equals(Conf.Question_Single)) {
			//如果是单选题，题目下面的答案都清除掉
			try {
				dao.updateBySql("delete from answersheet_tb where questionRef=? and userId=?"
						, new Object[]{questionRef, sessionUser.getUserId()});
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				answer = dao.findOneByHql("from Answersheet where questionRef=? and optionRef=? and userId=?"
						, new Object[]{questionRef, optionRef, sessionUser.getUserId()});
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		boolean insert = false;
		if (answer == null) {
			answer = new Answersheet();
			insert = true;
		}
		
		answer.setPaperRef(paperSid);
		answer.setUserId(sessionUser.getUserId());
		answer.setQuestionRef(questionRef);
		answer.setTrueOrFalse(trueOrFalse);
		answer.setFillsAnswer(fillsAnswer);
		answer.setOptionRef(optionRef);
		answer.setSubjectiveAnswer(subjectiveAnswer);
		answer.setType(q.getType());
		try {
			//计分
			Option theOption = dao.findOneByHql("from Option where sid=?"
					, new Object[]{optionRef});
			Constitute thisQuestion = dao.findOneByHql("from Constitute where questionRef=?"
					, new Object[]{q.getSid()});
			float scoring = ScoreTool.calc(q.getType(), theOption, answer, thisQuestion);
			answer.setScoring(scoring);//得分
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		
		try {
			if (insert) {
				dao.saveEntity(answer);
			} else {
				dao.updateEntity(answer);
			}
			System.out.println(answer);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 交试卷
	 * 计算成绩
	 */
	@Override
	public int submitPaper(User sessionUser, int paperSid, int timeComsuming) {
		try {
			List<String> questionIdList = dao.findBySql("select questionRef from constitute_tb where paperRef=?"
					, new Object[]{paperSid});
			String questionIds = Arrays.toString(questionIdList.toArray());
			List<Answersheet> answers = dao.findByHql("from Answersheet where userId=? and locate(questionRef, ?)>0 and paperRef=?"
					, new Object[]{sessionUser.getUserId(), questionIds, paperSid});
			float score = 0f;
			for (int i = 0; i < answers.size(); i++) {
				score += answers.get(i).getScoring();
			}
			Grade grade = dao.findOneByHql("from Grade where userId=? and paperRef=?"
					, new Object[]{sessionUser.getUserId(), paperSid});
			if (grade == null) {
				//登成绩
				grade = new Grade();
				grade.setPaperRef(paperSid);
				grade.setUserId(sessionUser.getUserId());
				grade.setTimeComsuming(timeComsuming);
				grade.setPoint(Math.round(score));
				grade.setTime(Tool.time());
				dao.saveEntity(grade);
				return Math.round(score);
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	/*@Override
	public int submitPaper(User sessionUser, int sid, int timeComsuming) {
		Paper paper = dao.findEntity(Paper.class, sid);
		
		
		try {
			List<Constitute> constitutes = dao.findBySql("from Constitute where paperRef=? order by sid asc"
					, new Object[]{sid});
			
			StringBuilder questionRefs = new StringBuilder();
			for (int i = 0; i < constitutes.size(); i++) {
				questionRefs.append(constitutes.get(i).getQuestionRef() + ",");
			}
			
			System.out.println("QuestionRefs = " + questionRefs);
			
			List<AnswerVO> vo = dao.findByHql("select new cn.examsys.lrx.vo.AnswerVO(a, b, q.point)"
					+ " from Answersheet a, Option b, Question q"
					+ " where a.questionRef=? and b.sid=a.optionRef and q.sid=b.questionRef"
					, new Object[]{questionRefs});
			
			//开始算分
			int score = 0;
			for (int i = 0; i < vo.size(); i++) {
				float point = ScoreTool.calc(vo.get(i).getOption(), vo.get(i).getAnswer());
				score += point;
			}
			
			//登成绩
			Grade grade = new Grade();
			grade.setPaperRef(sid);
			grade.setSubjectName(paper.getSubjectName());
			grade.setUserId(sessionUser.getUserId());
			grade.setTimeComsuming(timeComsuming);
			grade.setPoint(score);
			grade.setTime(Tool.time());
			
			dao.saveEntity(grade);
			
			return score;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}*/
	@Override
	public List<Paper> loadMyHistoryPapers(User sessionUser, int page) {
		try {
			return dao.findByHql("from Paper where userId=? order by sid desc" 
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public boolean todo1() {
		System.out.println("TODO 1");
		return false;
	}
	
	@Override
	public List<PaperWithExamVO> loadInvitedExamPapers(User sessionUser, int page) {
		try {
			List<Exam> exams = dao.findByHql("from Exam where locate(?, invitee)>0 order by sid desc"
					, new Object[]{sessionUser.getUserId()}, page);
			Map<Integer, Exam> examMap = new HashMap<>();
			StringBuilder examIds = new StringBuilder();
			
			for(int i=0;i<exams.size();i++) {
				examMap.put(exams.get(i).getSid(), exams.get(i));
				examIds.append(exams.get(i).getSid() + ",");
			}
			
			List<Paper> papers = dao.findByHql("from Paper where locate(examRef, ?)>0"
					, new Object[]{examIds.toString()});
			
			List<PaperWithExamVO> list = new ArrayList<>();
			for (int i = 0; i < papers.size(); i++) {
				list.add(new PaperWithExamVO(papers.get(i), examMap.get(papers.get(i).getExamRef())));
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<GradeVO> loadGradesByPaper(User sessionUser, int sid) {
		try {
			dao.findByHql("select new cn.examsys.lrx.vo.GradeVO(g, u, p)"
					+ " from Grade g, User u, Paper p where ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
