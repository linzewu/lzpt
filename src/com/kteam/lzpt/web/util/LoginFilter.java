package com.kteam.lzpt.web.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		if (req.getSession().getAttribute("user") != null
				||  req.getRequestURI().endsWith("user!login.action")
				||  (req.getRequestURI().endsWith("user!toPage.action") && "indexlogin".equals(req.getParameter("pageName")))
				||  req.getRequestURI().endsWith("dp!getMessage.action")
				) {
			chain.doFilter(request, response);	
		}
		else
		{    
			String uri=req.getRequestURI();
			
			
			if("GET".equalsIgnoreCase(req.getMethod())&&(uri.contains("index.action")||
					uri.contains("tsjb.action")||uri.contains("dfzfjd.action")||uri.contains("gbdn.action")
					||uri.contains("ycpp.action")
					)){
				req.getSession().setAttribute("gotoPage", req.getRequestURL().toString());
			}
			res.sendRedirect("user!toPage.action?pageName=indexlogin");
			
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		

	}

}
