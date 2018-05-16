package cn.examsys.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.examsys.bean.Student;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.xy.service.XyService;

public class CommonAction extends ActionSupport {
	protected HttpSession session = ServletActionContext.getRequest().getSession();
	protected HttpServletRequest request = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();
	
	protected String aa = "success";
	
	protected LrxService lrxservice;
	protected XyService xyservice;
	
	public void setLrxservice(LrxService lrxservice) {
		this.lrxservice = lrxservice;
	}
	public void setXyservice(XyService xyservice) {
		this.xyservice = xyservice;
	}
	
	
	public <T> void saveLogin(T user) {
		session.setAttribute("user", user);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getSessionUser() {
		return (T) session.getAttribute("user");
	}
	
	
	
}
