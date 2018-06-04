package cn.examsys.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.examsys.bean.Student;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.xy.service.XyService;

public abstract class CommonAction extends ActionSupport {
	protected HttpSession session = ServletActionContext.getRequest().getSession();
	protected HttpServletRequest request = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();
	
	protected String aa = "success";
	
	public <T> void saveLogin(T user) {
		session.setAttribute("user", user);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getSessionUser() {
		return (T) session.getAttribute("user");
	}
	
	protected String result = "success";
	public void setResult(String result) {
		this.result = result;
	}
	
	public abstract String getResult();
	
}
