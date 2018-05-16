package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
/*import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;*/
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Student;
import cn.examsys.common.CommonAction;

/*@Namespace("/")
@ParentPackage("json-default")
//********Spring 注解
//UserAction userAction=new UserAction();@Controller(value="userAction")
@Controller("userAction")
@Scope("prototype")*/
public class AjaxAction extends CommonAction {
	List<Student> stuLi;
	public void setStuLi(List<Student> stuLi) {
		this.stuLi = stuLi;
	}
	public List<Student> getStuLi() {
		return stuLi;
	}
	
	/*@Resource*/
	Student stu;
	
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	
	/*@Action( //表示请求的Action及处理方法  
            value="login",  //表示action的请求名称  
            results={  //表示结果跳转  
                    @Result(name="success",location="/success.jsp",type="redirect"),  
                    @Result(name="login",location="/login.jsp",type="redirect"),  
                    @Result(name="error",location="/error.jsp",type="redirect")  
            },  
            interceptorRefs={ //表示拦截器引用  
                    @InterceptorRef("defaultStack"),  
                    @InterceptorRef("timer")  
            },  
            exceptionMappings={  //映射映射声明  
                    @ExceptionMapping(exception="java.lang.Exception",result="error")  
            }  
    )  */
	//@Result(name = "error", type = "json")
	
	
	/*@Action(value="login")*/
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
		return aa;
	}
	
	
}
