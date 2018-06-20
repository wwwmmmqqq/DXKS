package cn.examsys.xy.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Exam;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.common.Tool;
import cn.examsys.xy.service.ExamPlanService;
import cn.examsys.xy.service.UserService;
@Namespace("/")
@ParentPackage("json-default")
@Controller("examPlanAction")
@Scope("prototype")
public class ExamPlanAction extends CommonAction {
	@Autowired
	ExamPlanService examPlanService;
	
	@Autowired
	UserService userService;
	
	Exam exam = new Exam();
	User user = new User();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
	/*创建考试计划*/
	@Action(value="/createExamPlan"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createExamPlan() {
		exam.setUserId(getSessionUserId());
		exam.setState(0);
		exam.setTime(Tool.time());
		user=userService.SelectOneUser(getSessionUserId());
		exam.setInvitee(user.getCollegeName());
		boolean ex=examPlanService.createExamPlan(exam);
		if(!ex) {
			setResult("创建失败");
		}else {
			setResult("创建成功");
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

}
