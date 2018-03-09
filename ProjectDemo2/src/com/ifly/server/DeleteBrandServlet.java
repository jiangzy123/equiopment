package com.ifly.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.BrandInfo;
import com.ifly.pojo.Brand;

/**删除设备信息
 * Servlet implementation class DeleteBrandServlet
 */
@WebServlet("/deleteBrandServlet.do")
public class DeleteBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public BrandInfo bInfo=new BrandInfo(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBrandServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		bInfo.deleteBrand(id);
		
		//重新将新数据显示到页面
		List<Brand> list=bInfo.getAllBrands();		
		request.setAttribute("lists", list);
		request.getRequestDispatcher("logListServlet.action").forward(request, response);
	}

}
