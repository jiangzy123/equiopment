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

/**新增用户信息
 * Servlet implementation class UserAddServlet
 */
@WebServlet("/doUserAddServlet")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      public UserInfoShow uInfo=new UserInfoShow(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		UserInfo user=new UserInfo();
		user.setName(request.getParameter("name"));
		user.setTrue_name(request.getParameter("t_name"));
		user.setSex(request.getParameter("sex"));
		user.setBrithday(request.getParameter("brithday"));
		user.setSid(request.getParameter("sid"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("email"));
		
		uInfo.add(user);
		List<UserInfo> list=uInfo.getAllUserInfos();
		request.setAttribute("newlist", list);
		request.getRequestDispatcher("doUserListServletPage").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
