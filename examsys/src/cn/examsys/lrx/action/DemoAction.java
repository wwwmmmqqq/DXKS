package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import cn.examsys.bean.Student;
import cn.examsys.common.CommonAction;

public class DemoAction extends CommonAction {
	
	List<Student> stuLi;
	public void setStuLi(List<Student> stuLi) {
		this.stuLi = stuLi;
	}
	public List<Student> getStuLi() {
		return stuLi;
	}
	
	Student stu;
	
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	
	public String login() {
		saveLogin(stu);
		return aa;
	}
	
	/*@Action(value="loadStuList")*/
	public String loadStuList() {
		stuLi = new ArrayList<Student>();
		for(int i=0;i<10;i++) {
			Student stu = new Student();
			stu.setStudentID(1000 + i);
			stu.setStudentName("studentName" + i);
			stuLi.add(stu);
		}
		System.out.println(stuLi.size());
		return "demo";
	}
	
}
