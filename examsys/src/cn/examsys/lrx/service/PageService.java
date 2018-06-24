package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;
import cn.examsys.lrx.vo.QuestionCheckVO;

public interface PageService {

	List<Question> loadQuestionList(int sid);

	List<Grade> loadGrades(User sessionUser, int page);

	List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int page);

	List<QuestionCheckVO> loadResponsibleQuestions(User sessionUser, int sid, int page);

	List<Question> searchQuestions(User sessionUser, String type, String key, int page);

	
}
