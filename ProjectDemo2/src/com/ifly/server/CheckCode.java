package com.ifly.server;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckCode
 */
@WebServlet("/CheckCode.do")
public class CheckCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int IMAGE_WIDTH = 100;
	private static final int IMAGE_HEIGHT = 30;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCode() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedImage bi = new BufferedImage(IMAGE_WIDTH, IMAGE_HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = bi.getGraphics();
		graphics.setColor(new Color(192, 192, 192));
		char[] codecar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
		String captcha = ""; // 存放生成验证码
	    Random random = new Random();
		for(int i=0;i<4;i++){
			int index = random.nextInt(codecar.length);
			graphics.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
			graphics.drawString(codecar[index] + "", (i * 20) + 15, 20);
	        captcha += codecar[index];
		
		}
        request.getSession().setAttribute("code", captcha);
        
        //通过ImageIO将图片输凿
        ImageIO.write(bi, "PNG", response.getOutputStream());
	
	}

}
