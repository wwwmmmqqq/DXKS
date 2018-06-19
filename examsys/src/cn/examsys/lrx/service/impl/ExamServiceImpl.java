package cn.examsys.lrx.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
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
import cn.examsys.lrx.vo.AnswerVO;

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
		/*try {
			return dao.findByHql("from Question where paperRef=?", new Object[]{sid}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		try {
			List<String> qlist = dao.findBySql("select questionRef from constitute_tb where paperRef=?", new Object[]{page});
			String qRefs = Arrays.toString(qlist.toArray());
			
			List<Question> questionList = dao.findByHql("from Question where locate(sid, ?)>0"
					, new Object[]{qRefs});
			
			List<Option> optionList = dao.findByHql("from Option where locate(questionRef, ?)>0"
					, new Object[]{qRefs});
			
			HashMap<Integer, List<Option>> mp = new HashMap<>();
			for (int i = 0; i < optionList.size(); i++) {
				if (mp.containsKey(optionList.get(i).getQuestionRef())) {
					mp.get(optionList.get(i).getQuestionRef()).add(optionList.get(i));
				} else {
					List<Option> li = new ArrayList<Option>();
					li.add(optionList.get(i));
					mp.put(optionList.get(i).getQuestionRef(), li);
				}
			}
			
			//将选项列表存入到Question对象中
			for (int i = 0; i < questionList.size(); i++) {
				questionList.get(i).setOptions(mp.get(questionList.get(i).getSid()));
			}
			
			return questionList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean todo(User sessionUser
			, int questionRef, int optionRef, String fillsAnswer, String subjectiveAnswer) {
		
		Question q;
		try {
			q = dao.findOneByHql("from Question where sid=?", new Object[]{questionRef});
		} catch (Exception e1) {
			e1.printStackTrace();
			return false;
		}
		
		Answersheet answer = null;
		try {
			answer = dao.findOneByHql("from Answersheet where questionRef=? and optionRef=? and userId=?"
					, new Object[]{questionRef, optionRef, sessionUser.getUserId()});
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		boolean insert = false;
		if (answer == null) {
			answer = new Answersheet();
			insert = true;
		}
		
		answer.setQuestionRef(questionRef);
		answer.setFillsAnswer(fillsAnswer);
		answer.setOptionRef(optionRef);
		answer.setSubjectiveAnswer(subjectiveAnswer);
		answer.setType(q.getType());
		
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
				int point = ScoreTool.calc(vo.get(i).getOption(), vo.get(i).getAnswer());
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
	}
	@Override
	public List<Paper> loadMyHistoryPapers(User sessionUser, int page) {
		try {
			return dao.findByHql("from Paper order by sid desc" //from Paper where userId=? order by sid desc
					/*, new Object[]{sessionUser.getUserId()}*/, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
