package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;

public interface ExamService {
	/**
	 * 通过大学名获取自己的试卷列表
	 * @param sessionUser
	 * @param page
	 * @return
	 */
	List<Exam> loadMyExamsList(User sessionUser, int page);

	List<Paper> loadPapersByExam(User sessionUser, int sid, int page);

	/**
	 * 开始考试
	 * @param sessionUser
	 * @param sid
	 * @return
	 */
	boolean startExamPaper(User sessionUser, int sid);

	List<Question> loadQuestionList(int sid, int page);
	
	boolean todo(User sessionUser, int questionRef, int isSelected, String fillsAnswer, String subjectiveAnswer);

	int submitPaper(User sessionUser, int sid, int timeComsuming);
	
}
