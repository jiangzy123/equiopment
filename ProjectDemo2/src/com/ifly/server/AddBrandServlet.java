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

/**
 * 增加设备信息
 * Servlet implementation class AddBrandServlet
 */
@WebServlet("/addBrandServlet.do")
public class AddBrandServlet extends HttpServlet {	
	private static final long serialVersionUID = 1L;
	public BrandInfo bInfo=new BrandInfo();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBrandServlet() {
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
		
		String bnumber=request.getParameter("bNumber");
		String bid=request.getParameter("bId");
		String bname=request.getParameter("bName");
		String btype=request.getParameter("btype");
		String baddress=request.getParameter("bAddress");
		String bdate=request.getParameter("bDate");
		String bstatic=request.getParameter("bstatic");
		
		Brand brand=new Brand();
		brand.setbId(bid);
		brand.setbNumber(bnumber);
		brand.setbName(bname);
		brand.setBtype(btype);
		brand.setbDate(bdate);
		brand.setbAddress(baddress);
		brand.setBstatic(bstatic);
		
		bInfo.addBrand(brand);
		List<Brand> list=bInfo.getAllBrands();		
		request.setAttribute("lists", list);
		request.getRequestDispatcher("logListServlet.action").forward(request, response);
	}

}
