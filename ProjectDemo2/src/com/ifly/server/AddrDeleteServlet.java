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


/**删除地址信息
 * Servlet implementation class AddrDeleteServlet
 */
@WebServlet("/doAddrDeleteServlet")
public class AddrDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 public AddrInfo aInfo=new AddrInfo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddrDeleteServlet() {
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
		aInfo.delete(id);
		
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
