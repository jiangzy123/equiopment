package com.ifly.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class DoBussinessServlet
 */
@WebServlet("/doBussinessServlet")
public class DoBussinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoBussinessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String page = "";
		switch (action) {
		
		case "declare":			
			page = "declare.jsp";
			break;
		case "userInfo":			
			page = "doUserListServletPage";
			break;
		case "user":			
			page = "ueAD.jsp";
			break;	
		case "partList":			
			page = "partList.jsp";
			break;
		case "declare1":			
			page = "declare1.jsp";
			break;
		case "cardList":			
			page = "cardList.jsp";
			break;
			
		case "logList":			
			page = "logListServlet.action";
			break;
		case "addrListServlet":			
			page = "addrListServlet.action";
			break;
		case "pic1":			
			page = "doPicDateServlet1";
			break;
		case "pic2":			
			page = "pic2.jsp";
			break;
		case "pic3":			
			page = "pic3.jsp";
			break;
		case "errblist":			
			page = "doErrBrListServlet";
			break;
		case "haserr":			
			page = "doLogListServlet1";
			break;
		case "fixerr":			
			page = "doErrfixListServlet";
			break;
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
