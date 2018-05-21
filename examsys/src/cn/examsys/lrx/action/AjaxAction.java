package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import cn.examsys.bean.Student;
import cn.examsys.common.CommonAction;

@Namespace("/")
@ParentPackage("json-default")
//********Spring ע��
//UserAction userAction=new UserAction();@Controller(value="userAction")
/*@Controller("AjaxAction")
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
	
	/*@Action( //��ʾ�����Action�����?��  
            value="login",  //��ʾaction���������  
            results={  //��ʾ�����ת  
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
	//@Result(name = "error", type = "json")
	
	
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
