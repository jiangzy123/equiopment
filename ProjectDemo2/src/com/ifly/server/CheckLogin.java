package com.ifly.server;
/**
 * ��¼У��-�û����������У��
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
			errMsg = "��֤�����";
			request.setAttribute("errMsg", errMsg);
			System.out.println("��֤�����");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
			
		}
		if(userCheck.CheckIll("username", username)){
			if(userCheck.CheckIll("password", password)){
				if(userCheck.CheckLogin(username, password)){
					System.out.println("��¼�ɹ���");
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
					errMsg = "�û������벻ƥ�䣬��¼ʧ��";
					request.setAttribute("errMsg", errMsg);
					request.setAttribute("errMsg", errMsg);
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}else{
				if(password.length()<6){
					errMsg = "����Ϊ8-16λ��ĸ��������ɣ�";
					request.setAttribute("errMsg", errMsg);
					System.out.println("����Ϊ8-16λ��ĸ��������ɣ�");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}else {
					errMsg = "�����ʽ����ȷ";
					request.setAttribute("errMsg", errMsg);
					System.out.println("�����ʽ����ȷ");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}
		}else{
			errMsg = "�û�����ʽ����ȷ";
			request.setAttribute("errMsg", errMsg);
			System.out.println("�û�����ʽ����ȷ");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		 }
		}
	}

}
