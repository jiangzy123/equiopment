package com.ifly.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.UserInfoShow;
import com.ifly.pojo.UserInfo;

/**根据用户名和真实姓名查找员工信息
 * Servlet implementation class UserQueryServlet
 */
@WebServlet("/doUserQueryServlet")
public class UserQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public UserInfoShow uInfo=new UserInfoShow();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String uname=request.getParameter("uname");
		String tname=request.getParameter("tname");
		List<UserInfo> list= uInfo.query(uname, tname);
		
		
		request.setAttribute("newlist", list);
		request.getRequestDispatcher("list.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
