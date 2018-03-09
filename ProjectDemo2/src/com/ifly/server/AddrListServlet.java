package com.ifly.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.AddrInfo;
import com.ifly.contro.BrandInfo;
import com.ifly.page.PageInfo;
import com.ifly.pojo.Addr;
import com.ifly.pojo.Brand;

/**·ÖÒ³
 * Servlet implementation class AddrListServlet
 */
@WebServlet("/addrListServlet.action")
public class AddrListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AddrInfo bInfo=new AddrInfo();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddrListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Addr> navbarList=bInfo.getAllAddrs();
		
		
		request.setAttribute("anavbar", navbarList);
		String currentPage=request.getParameter("currentPage");
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurrentPage(currentPage==null?1:Integer.parseInt(currentPage));
		bInfo.queryPage(pageInfo);
		request.setAttribute("alists", pageInfo.getValue());
		List<Integer> pageIndexList=new ArrayList<>();
		Integer page=pageInfo.getCurrentPage();
		int start=1;
		if(page>3){
			start=page-2;
		}
		for(int i=0;i<5;i++){
			pageIndexList.add(start++);
		}
		
		request.setAttribute("pageIndexList2", pageIndexList);
		request.getRequestDispatcher("list2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	@SuppressWarnings("unused")
	private List<Addr> buildNavbarData(){
		List<Addr> list=new ArrayList<>();
		Addr b1=new Addr();
		b1.setMan("1");
		Addr b2=new Addr();
		b2.setMan("2");
		list.add(b1);
		list.add(b2);
		return list;
	}

}
