package com.ifly.server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.BrandInfo;
import com.ifly.contro.ErroInfo;
import com.ifly.pojo.Brand;
import com.ifly.pojo.ErrBs;
import com.ifly.pojo.ErrorB;

/**
 * Servlet implementation class ErrBrAddServlet
 */
@WebServlet("/doErrBrAddServlet")
public class ErrBrAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BrandInfo bInfo=new BrandInfo();
	public ErroInfo eInfo=new ErroInfo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrBrAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		List<String> list= bInfo.getBIDs();
		ErrorB errorB=new ErrorB();
		String id=request.getParameter("id");
		errorB.setId(id);
		errorB.setBid(request.getParameter("bId"));
		errorB.setEdate(request.getParameter("edate"));
		errorB.setEtatic("´ýÎ¬ÐÞ");
		
		for(String s:list){
			if(s.equals("id")){
				
				eInfo.add(errorB);
				List<ErrBs> list1=eInfo.getAllErrsB();		
				request.setAttribute("elists", list1);
				System.out.println("11111");
				request.getRequestDispatcher("doErrBrListServlet").forward(request, response);
			    
				return ;
			}else{
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return ;
			}
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
