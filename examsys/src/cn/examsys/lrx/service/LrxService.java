package cn.examsys.lrx.service;

import cn.examsys.bean.Student;

public interface LrxService {
	
	void testService();
	
	void saveStudent(Student stu);

	Student loadStudent(int sid);
	
}
