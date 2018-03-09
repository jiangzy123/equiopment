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
 * Servlet implementation class ModifyBrandServlet
 */
@WebServlet("/doModifyBrandServlet")
public class ModifyBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public BrandInfo bInfo=new BrandInfo();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBrandServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		String id=request.getParameter("id");
		
		System.out.println("id"+id);
		String bnumber=request.getParameter("bNumber");
		
		String bname=request.getParameter("bName");
		String btype=request.getParameter("btype");
		String baddress=request.getParameter("bAddress");
		String bdate=request.getParameter("bDate");
		String bstatic=request.getParameter("bstatic");
		
		bname=new String(bname.getBytes("iso8859-1"),"UTF-8");
		btype=new String(btype.getBytes("iso8859-1"),"UTF-8");
		baddress=new String(baddress.getBytes("iso8859-1"),"UTF-8");
		bdate=new String(bdate.getBytes("iso8859-1"),"UTF-8");
		bstatic=new String(bstatic.getBytes("iso8859-1"),"UTF-8");
		
		Brand brand=new Brand();
		brand.setbId(id);
		brand.setbNumber(bnumber);
		brand.setbName(bname);
		brand.setBtype(btype);
		brand.setbDate(bdate);
		brand.setbAddress(baddress);
		brand.setBstatic(bstatic);
		
		bInfo.modifyBrand(id,brand);
		
		List<Brand> list=bInfo.getAllBrands();		
		request.setAttribute("lists", list);
		request.getRequestDispatcher("logListServlet.action").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
