package cn.examsys.lrx.action;

import java.util.ArrayList;
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
public class AjaxAction extends CommonAction {
	
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
	
	/*@Action( 
            value="login",  
            results={ 
                    @Result(name="success",location="/success.jsp",type="redirect"),  
                    @Result(name="login",location="/login.jsp",type="redirect"),  
                    @Result(name="error",location="/error.jsp",type="redirect")  
            },  
            interceptorRefs={ //��ʾ����������  
                    @InterceptorRef("defaultStack"),  
                    @InterceptorRef("timer")  
            },  
            exceptionMappings={  //ӳ��ӳ������  
                    @ExceptionMapping(exception="java.lang.Exception",result="error")  
            }
    )  */
	
	@Action(value="/login")
	public String login() {
		System.out.println("login");
		saveLogin(stu);
		return aa;
	}
	
	@Action(value="/loadStuList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadStuList() {
		System.out.println("Action层被调用, stu = " + stu);
		lrxService.testService();//调用Service层
		
		stuLi = new ArrayList<Student>();
		for(int i=0;i<10;i++) {
			Student stu = new Student();
			stuLi.add(stu);
		}
		
		System.out.println(stuLi.size());
		return aa;
	}
	
	
	@Override
	public String getResult() {
		return result;
	}
	
}
