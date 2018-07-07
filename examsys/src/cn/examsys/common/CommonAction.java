package cn.examsys.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.examsys.bean.User;

public abstract class CommonAction extends ActionSupport {
	protected HttpSession session = ServletActionContext.getRequest().getSession();
	protected HttpServletRequest request = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();
	
	protected String aa = "success";
	
	public CommonAction() {
		/*User user = new User();
		user.setUserId("a2");
		user.setPsw("123");
		user.setType("admin");
		user.setName("nick");
		user.setCollegeName("萍乡学院");
		user.setPermission("");
		user.setSex("男");
		saveLogin(user);*/
		
		session.setAttribute("Time", Tool.time());//服务器时间
		
	}
	
	public void saveLogin(User user) {
		session.setAttribute("user", user);
	}
	
	public User getSessionUser() {
		return (User) session.getAttribute("user");
	}
	
	public String getSessionUserId() {
		User u = getSessionUser();
		return u!=null?u.getUserId():null;
	}
	
	public boolean isLogin() {
		return getSessionUser() != null;
	}
	
	protected String result = "success";
	public void setResult(String result) {
		this.result = result;
	}
	
	public abstract String getResult();
	
}
