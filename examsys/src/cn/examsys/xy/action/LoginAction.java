package cn.examsys.xy.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.LoginService;
@ParentPackage("struts-default")
@Namespace("/")
@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends CommonAction implements ModelDriven<User>{
	User user = new User();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Autowired
	protected LoginService loginService;
	
	@Action(value="login",results={@Result(name=INPUT,location="infomation.jsp")})
	public String login(){
		User loginUser=loginService.login(user.getUserId());
		
		if(loginUser==null){
			setResult("未找到该账号！");
		}else if(loginUser.getPsw()!=user.getPsw()){
			setResult("密码错误！");
		}
		saveLogin(user);
		System.out.println(user.getUserId());
		return INPUT;
		
	}
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}
	
}
