package com.ifly.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.AddrInfo;
import com.ifly.pojo.Addr;


/**新增地址信息
 * Servlet implementation class AddAddrServlet
 */
@WebServlet("/doAddAddrServlet")
public class AddAddrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      public AddrInfo aInfo=new AddrInfo(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		Addr addr=new Addr();
		
		addr.setAddress(request.getParameter("address"));
		addr.setMan(request.getParameter("man"));
		addr.setAtype(request.getParameter("atype"));
		addr.setPhone(request.getParameter("phone"));
		addr.setId(request.getParameter("id"));
		aInfo.add(addr);
		List<Addr> list=aInfo.getAllAddrs();		
		request.setAttribute("alists", list);
		request.getRequestDispatcher("addrListServlet.action").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
