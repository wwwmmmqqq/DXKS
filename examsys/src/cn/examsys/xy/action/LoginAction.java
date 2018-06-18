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
@ParentPackage("json-default")
@Namespace("/")
@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends CommonAction{
	private User user = new User();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Autowired
	protected LoginService loginService;
	/*用户登录*/
	@Action(value="/login"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String login(){
		String pass=user.getPsw();
		user=loginService.login(user.getUserId());
		if(user.getUserId()==null){
			setResult("未找到该账号！");
		}else if(!pass.equals(user.getPsw())) {
					setResult("密码错误！");
		}
		saveLogin(user);
		return aa;
	}
	
	@Action(value="/loginOut"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loginOut() {
		if(!isLogin()){
			setResult("请先登录");
		}
		session.removeAttribute("user");
		setResult("成功退出");
		return aa;
	}
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}
	
}
