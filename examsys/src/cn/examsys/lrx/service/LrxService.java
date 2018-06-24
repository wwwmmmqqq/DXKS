package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Subject;
import cn.examsys.bean.User;

public interface LrxService {
	
	void testService();

	boolean deleteQuestion(User sessionUser, int sid);


	boolean editQuestion(User sessionUser, int sid, List<String> fields, List<String> values);

	List<Subject> loadSubjects();
}
