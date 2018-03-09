package com.ifly.server;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ifly.contro.BrandInfo;

/**
 * Servlet implementation class PicDateServlet1
 */
@WebServlet("/doPicDateServlet1")
public class PicDateServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BrandInfo bInfo=new BrandInfo();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PicDateServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Map<String, Integer> map=new HashMap<>();
			map=bInfo.getcountByType();
			
			request.setAttribute("map", map);
			request.getRequestDispatcher("pic1.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
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
