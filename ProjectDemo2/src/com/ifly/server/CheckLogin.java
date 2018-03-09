package com.ifly.server;
/**
 * 登录校验-用户名和密码的校验
 */
import java.io.IOException;

import javax.print.DocFlavor.STRING;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.UserCheck;
import com.ifly.dao.DbHelper;
import com.ifly.pojo.User;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin.do")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbHelper db = new DbHelper();
	private UserCheck userCheck = new UserCheck();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String checkCode = request.getParameter("checkCode");
		String accept = request.getParameter("accept");
		String errMsg = "";
		String code = (String)request.getSession().getAttribute("code");
		if(code!=null&&checkCode!=null){
		if(!checkCode.equalsIgnoreCase(code)){
			errMsg = "验证码错误";
			request.setAttribute("errMsg", errMsg);
			System.out.println("验证码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
			
		}
		if(userCheck.CheckIll("username", username)){
			if(userCheck.CheckIll("password", password)){
				if(userCheck.CheckLogin(username, password)){
					System.out.println("登录成功！");
					User user = userCheck.getUser(username);
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("user",user);
					if(accept==null){
						request.getRequestDispatcher("index.jsp").forward(request, response);
						return;
					}else {
						Cookie userN = new Cookie("username", username);
						Cookie userP = new Cookie("password", password);
						userN.setMaxAge(60*60*24*7);
						userP.setMaxAge(60*60*24*7);
						response.addCookie(userN);
						response.addCookie(userP);
						request.getRequestDispatcher("index.jsp").forward(request, response);
						return;
					}
						
					
				}else {
					errMsg = "用户名密码不匹配，登录失败";
					request.setAttribute("errMsg", errMsg);
					request.setAttribute("errMsg", errMsg);
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}else{
				if(password.length()<6){
					errMsg = "密码为8-16位字母和数字组成！";
					request.setAttribute("errMsg", errMsg);
					System.out.println("密码为8-16位字母和数字组成！");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}else {
					errMsg = "密码格式不正确";
					request.setAttribute("errMsg", errMsg);
					System.out.println("密码格式不正确");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}
		}else{
			errMsg = "用户名格式不正确";
			request.setAttribute("errMsg", errMsg);
			System.out.println("用户名格式不正确");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		 }
		}
	}

}
