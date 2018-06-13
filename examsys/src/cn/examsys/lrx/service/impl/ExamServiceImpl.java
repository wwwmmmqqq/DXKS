package cn.examsys.lrx.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
import cn.examsys.common.ScoreTool;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.ExamDaoImpl;
import cn.examsys.lrx.service.ExamService;

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
	public List<Question> loadQuestionList(int sid, int page) {
		try {
			return dao.findByHql("from Question where paperRef=?", new Object[]{sid}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean todo(User sessionUser
			, int questionRef, int isSelected, String fillsAnswer, String subjectiveAnswer) {
		
		Question q = dao.findEntity(Question.class, questionRef);
		
		Answersheet answer = new Answersheet();
		answer.setQuestionRef(questionRef);
		answer.setFillsAnswer(fillsAnswer);
		answer.setIsSelected(isSelected);
		answer.setSubjectiveAnswer(subjectiveAnswer);
		answer.setType(q.getType());
		
		try {
			dao.saveEntity(answer);
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
	public int submitPaper(User sessionUser, int sid, int timeComsuming) {
		Paper paper = dao.findEntity(Paper.class, sid);
		
		Grade grade = new Grade();
		grade.setPaperRef(sid);
		grade.setSubjectName(paper.getSubjectName());
		grade.setTime(Tool.time());
		grade.setUserId(sessionUser.getUserId());
		grade.setTimeComsuming(timeComsuming);
		
		try {
			List<Constitute> constitutes = dao.findBySql("from Constitute where paperRef=? order by sid asc"
					, new Object[]{sid});
			
			StringBuilder questionRefs = new StringBuilder();
			for (int i = 0; i < constitutes.size(); i++) {
				questionRefs.append(constitutes.get(i).getQuestionRef() + ",");
			}
			
			System.out.println("QuestionRefs = " + questionRefs);
			
			List<Option> options = dao.findByHql("from Option where locate(questionRef, ?)>0 order by sid asc"
					, new Object[]{questionRefs});
			
			//选项数组
			HashMap<Integer, Option> optMap = new HashMap<>();
			for (int i = 0; i < options.size(); i++) {
				optMap.put(options.get(i).getQuestionRef(), options.get(i));
			}
			//拿到学生答案 (从小到大排序)
			List<Answersheet> answers = dao.findByHql("from Answersheet where locate(questionRef, ?)>0 order by sid asc"
					, new Object[]{questionRefs});
			
			System.out.println("选项和答案：");
			for (int i = 0; i < answers.size(); i++) {
				System.out.println(answers.get(i).getSid() + ",");
			}
			
			for (int i = 0; i < answers.size(); i++) {
				if (Conf.Question_Multiple.equals(answers.get(i).getType())) {
					//如果是多选题
					List<Option> question_options = dao.findByHql("from Option where questionRef=?"
							, new Object[]{answers.get(i).getQuestionRef()});
					ScoreTool.matchs(question_options, answers.get(i));
				} else {
					//ScoreTool.match(, answers.get(i));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		List<Answersheet> answers = dao.findByHql("from Answersheet where userId=? and paperRef=?"
				, new Object[]{sessionUser.getUserId(), sid});
		
		List<Option> options = dao.findByHql("from Option where questionRef=")
		int score = ScoreTool.
		grade.setPoint(point);
		*/
		return -1;
	}
	
}
