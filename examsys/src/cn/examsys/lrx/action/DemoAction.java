package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Student;
import cn.examsys.common.CommonAction;

@Namespace("/")
@ParentPackage("struts-default")

@Controller("demoAction")  //创建对象
@Scope("prototype")    //多实例方式创建对象

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
	@Action(value="/loadStuListPage",results={
			@Result(name="demo",location="/pages/lrx/demo.jsp")
	})
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
	@Override
	public String getResult() {
		return result;
	}
	
}
