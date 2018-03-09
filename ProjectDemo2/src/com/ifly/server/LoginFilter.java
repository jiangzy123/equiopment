package com.ifly.server;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

/**
 * Servlet Filter implementation class LoginFilter
 */

public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest)request;
		HttpServletResponse response2 = (HttpServletResponse)response;
		HttpSession session = request2.getSession();
		String errMsg = "";
		if(request2.getRequestURI().indexOf("login.jsp")!=-1||request2.getRequestURI().indexOf("CheckLogin.do")!=-1){
			chain.doFilter(request, response);
			return;
		}
		
		if(session.getAttribute("username")!=null){
			chain.doFilter(request, response);
		}else {
			errMsg = "ÇëÏÈµÇÂ¼";
			request.setAttribute("errMsg",errMsg);
			request.getRequestDispatcher("login.jsp").forward(request2, response2);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
