package cn.examsys.lrx.action;

import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Student;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.LrxService;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("ajaxAction")
@Scope("prototype")
public class StuAction extends CommonAction {
	@Autowired
	protected LrxService lrxService;
	
	List<Student> stuLi;
	public void setStuLi(List<Student> stuLi) {
		this.stuLi = stuLi;
	}
	public List<Student> getStuLi() {
		return stuLi;
	}
	
	Student stu = new Student();
	public Student getStu() {
		return stu;
	}
	
	@Action(value="/login")
	public String login() {
		System.out.println("login");
		saveLogin(stu);
		return aa;
	}
	
	@Action(value="/loadStuList",results={@Result(type="json")})
	public String loadStuList() {
		return aa;
	}
	
	
	
	@Override
	public String getResult() {
		return result;
	}
	
}
