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
import com.ifly.page.PageInfo;

import com.ifly.pojo.UserInfo;

/**用户信息分页
 * Servlet implementation class UserListServlet
 */
@WebServlet("/doUserListServletPage")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UserInfoShow uInfo=new UserInfoShow(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
List<UserInfo> navbarList=uInfo.getAllUserInfos();
		
		
		request.setAttribute("anavbar", navbarList);
		String currentPage=request.getParameter("currentPage");
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurrentPage(currentPage==null?1:Integer.parseInt(currentPage));
		uInfo.queryPage(pageInfo);
		request.setAttribute("newlist", pageInfo.getValue());
		List<Integer> pageIndexList=new ArrayList<>();
		Integer page=pageInfo.getCurrentPage();
		int start=1;
		if(page>3){
			start=page-2;
		}
		for(int i=0;i<5;i++){
			pageIndexList.add(start++);
		}
		
		request.setAttribute("pageIndexList3", pageIndexList);
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
