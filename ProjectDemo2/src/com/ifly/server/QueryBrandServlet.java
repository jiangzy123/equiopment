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
import com.ifly.pojo.Brand;

/**
 * Servlet implementation class QueryBrandServlet
 */
@WebServlet("/doQueryBrandServlet")
public class QueryBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BrandInfo bInfo=new BrandInfo(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryBrandServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//System.out.println("-------");
		String bid=request.getParameter("bid");
		//System.out.println("aaaaaa"+bid);
		Brand brand= bInfo.getBrand(bid);
		//System.out.println(brand+"....");
		List<Brand> list=new ArrayList<Brand>();
		list.add(brand);
		for(Brand b:list){
			System.out.println(b);
		}
		request.setAttribute("lists", list);
		request.getRequestDispatcher("list1.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
