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

/**地址信息修改
 * Servlet implementation class AddrModifyServlet
 */
@WebServlet("/doAddrModifyServlet")
public class AddrModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     public AddrInfo aInfo=new AddrInfo();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddrModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		String id=request.getParameter("id");
		String address=request.getParameter("address");
		String man=request.getParameter("man");
		String atype=request.getParameter("atype");
		String phone=request.getParameter("phone");
		
		id=new String(id.getBytes("iso8859-1"),"UTF-8");
		address=new String(address.getBytes("iso8859-1"),"UTF-8" );
		man=new String(man.getBytes("iso8859-1"),"UTF-8");
		atype=new String(atype.getBytes("iso8859-1"),"UTF-8");
		phone=new String(phone.getBytes("iso8859-1"),"UTF-8");
		
		Addr addr=new Addr();
		addr.setAddress(address);
		addr.setAtype(atype);
		addr.setId(id);
		addr.setMan(man);
		addr.setPhone(phone);
		
		aInfo.modifyAddr(id, addr);
		
		//重新将新数据显示到页面
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
