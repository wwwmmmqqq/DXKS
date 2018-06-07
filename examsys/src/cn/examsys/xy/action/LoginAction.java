package cn.examsys.xy.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.LoginService;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("loginAction")
@Scope("prototype")

public class LoginAction extends CommonAction implements ModelDriven<User>{
	User user=new User();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Autowired
	protected LoginService loginService;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return null;
	}

}
