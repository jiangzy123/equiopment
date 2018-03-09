package com.ifly.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.BrandInfo;
import com.ifly.page.PageInfo;
import com.ifly.pojo.Brand;

/**故障申报信息显示
 * Servlet implementation class LogListServlet1
 */
@WebServlet("/doLogListServlet1")
public class LogListServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BrandInfo bInfo=new BrandInfo();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogListServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Brand> navbarList=bInfo.getAllBrands();
		String id=request.getParameter("bId");
		
		request.setAttribute("navbar", navbarList);
		
		String currentPage=request.getParameter("currentPage");
		System.out.println("currentPage:"+currentPage);
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurrentPage(currentPage==null?1:Integer.parseInt(currentPage));
		bInfo.queryPage(pageInfo);
		request.setAttribute("lists", pageInfo.getValue());
		List<Integer> pageIndexList=new ArrayList<>();
		Integer page=pageInfo.getCurrentPage();
		int start=1;
		if(page>3){
			start=page-2;
		}
		for(int i=0;i<5;i++){
			pageIndexList.add(start++);
		}
		
		request.setAttribute("pageIndexList", pageIndexList);
		request.getRequestDispatcher("list1_01.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
