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

/**修改用户信息
 * Servlet implementation class UserModifyServlet
 */
@WebServlet("/doUserModifyServlet")
public class UserModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public UserInfoShow uInfo=new UserInfoShow(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("sid");
		UserInfo user=new UserInfo();
		user.setName(new String(request.getParameter("name").getBytes("iso8859-1"),"utf-8"));
		user.setTrue_name(new String(request.getParameter("t_name").getBytes("iso8859-1"),"utf-8"));
		user.setSex(new String( request.getParameter("sex").getBytes("iso8859-1"),"utf-8"));
		user.setBrithday(new String( request.getParameter("brithday").getBytes("iso8859-1"),"utf-8"));
		user.setSid(new String(id.getBytes("iso8859-1"),"utf-8"));
		user.setPhone(new String(request.getParameter("phone").getBytes("iso8859-1"),"utf-8"));
		user.setEmail(new String(request.getParameter("email").getBytes("iso8859-1"),"utf-8"));
		
		uInfo.modifyAddr(id, user);
		//重新将新数据显示到页面
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
