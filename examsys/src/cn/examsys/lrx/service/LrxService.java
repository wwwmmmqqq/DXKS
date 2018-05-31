package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Student;

public interface LrxService {
	
	void testService();
	
	void saveStudent(Student stu);

	Student loadStudent(int sid);

	List<Student> loadStuList(int page);

	int loadStuListPage();
	
}
