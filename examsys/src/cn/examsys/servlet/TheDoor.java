package cn.examsys.servlet;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class TheDoor extends StrutsPrepareAndExecuteFilter {
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		String url = request.getRequestURL().toString();
		System.out.println("visit:" + url);
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null && !url.contains("pages/gy/login.jsp")) {
			HttpServletResponse response = (HttpServletResponse) res;
			response.sendRedirect("pages/gy/login.jsp");
			response.getWriter().write("<script>alert('请先登录');</script>");
			response.getWriter().flush();
		}
		
		super.doFilter(req, res, chain);
	}
	
}

