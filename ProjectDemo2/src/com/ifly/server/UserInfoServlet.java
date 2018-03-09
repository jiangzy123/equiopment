package com.ifly.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.UserInfoShow;
import com.ifly.pojo.Brand;
import com.ifly.pojo.UserInfo;

/**显示用户信息
 * Servlet implementation class UserInfoServlet
 */
@WebServlet("/userInfoServlet.action")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public UserInfoShow ui=new UserInfoShow();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
			
			List<UserInfo> list=new ArrayList<>();
			list=ui.getAllUserInfos();
			request.setAttribute("newlist", list);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
