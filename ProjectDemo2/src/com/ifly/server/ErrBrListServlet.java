package com.ifly.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.ErroInfo;
import com.ifly.page.PageInfo;

import com.ifly.pojo.ErrBs;

/**
 * Servlet implementation class ErrBrListServlet
 */
@WebServlet("/doErrBrListServlet")
public class ErrBrListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public ErroInfo eInfo=new ErroInfo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrBrListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ErrBs> navbarList=eInfo.getAllErrsB();
		
		
		request.setAttribute("anavbar", navbarList);
		String currentPage=request.getParameter("currentPage");
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurrentPage(currentPage==null?1:Integer.parseInt(currentPage));
		eInfo.queryPage(pageInfo);
		request.setAttribute("elists", pageInfo.getValue());
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
		request.getRequestDispatcher("list3.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
