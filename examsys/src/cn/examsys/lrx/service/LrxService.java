package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;

public interface LrxService {
	
	void testService();

	boolean deleteQuestion(User sessionUser, int sid);


	boolean editQuestion(User sessionUser, int sid, List<String> fields, List<String> values);

	List<Subject> loadSubjects();

	boolean delPaper(User sessionUser, int sid);

	boolean invite(User sessionUser, int sid, String text);

	boolean delExam(User sessionUser, int sid);

	List<User> loadUsers(User sessionUser);

	List<Question> searchQuestionsHandConstitute(User sessionUser, List<String> keys, List<String> vals, int page);

}
