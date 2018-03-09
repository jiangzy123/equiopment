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
import com.ifly.pojo.Result;

/**
 * Servlet implementation class PicDateServlet
 */
@WebServlet("/doPicDateServlet")
public class PicDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     public BrandInfo bInfo=new BrandInfo();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PicDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
			
			List<Result> list=new ArrayList<>();
			list=bInfo.getcount();
			 List<Integer> list1=new ArrayList<>();
			
			 Result r=new Result();
		       for(int i=0;i<list.size();i++){
		    	   int m=0;
		    	   r=list.get(i);
		    	  if(r.getType().equals("电子设备")){
		    		  m=Integer.parseInt(r.getDate());		    		  
	    			  list1.add(m-1, r.getCount());
	    			  
		    	  }
		       }
			request.setAttribute("list1", list);
			request.getRequestDispatcher("pic2.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
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
