package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Grade;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.lrx.vo.GradeVO;
import cn.examsys.lrx.vo.HistoryGradeVO;
import cn.examsys.lrx.vo.PersonalHomePageVO;
import cn.examsys.lrx.vo.QuestionCheckVO;

public interface PersonalService {
	
	PersonalHomePageVO searchExamsBy(User sessionUser, String filed, String words);

	PersonalHomePageVO loadStuIndexDatas(User sessionUser);

	void updateStuInfos(User sessionUser, Object[] fields, Object[] values);

	List<Grade> loadGradeList(User sessionUser, int page);

	boolean updatePsw(User sessionUser, String oldPsw, String newPsw);

	List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int page);

	List<GradeVO> loadHistoryGrades(User sessionUser, int page);

	List<Exam> loadExams(User sessionUser, int page);

	boolean checkQuestion(String checker, int sid, float scoring,
			String question_Subjective);

	String registUser(String userId, String psw, String email,String name);

}
