package cn.examsys.servlet;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class TheDoor extends StrutsPrepareAndExecuteFilter {
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		String url = request.getRequestURL().toString();
		System.out.println("visit:" + url);
		
		super.doFilter(req, res, chain);
	}
	
}

