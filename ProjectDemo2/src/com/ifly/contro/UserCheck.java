package com.ifly.contro;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.jws.soap.SOAPBinding.Use;

import com.ifly.dao.DbHelper;
import com.ifly.pojo.User;

import oracle.net.aso.r;

public class UserCheck {
	private DbHelper db = new DbHelper();
	public  boolean CheckIll(String name,String value){
		switch (name) {
		case "username":
			  //能是数字 字母(大小写都可以) 中文 不允许任何符号 长度无限制
			  String regex = "([a-z]|[A-Z]|[0-9]|[\\u4e00-\\u9fa5])+";
			  Pattern nameP = Pattern.compile(regex);
			  Matcher nameM = nameP.matcher(value);
			  return nameM.matches();
		case "password":
			String Pregex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{5,16}$";	
			Pattern passP = Pattern.compile(Pregex);
			Matcher passM = passP.matcher(value);
			return passM.matches();
		}
		return false;
	}
	
	public  boolean CheckLogin(String username,String password){
		List<User> users = getAllUser();
		
		for(User user:users){
			if(username.equals(user.getName())){
				if(password.equals(user.getPass())){
					return true;
				}
			}
		}
		return false;
		
	}
	
	public List<User> getAllUser(){
		List<User> users =null;
		try {
			users = new ArrayList<User>();
			String sql = "select name,pass from wsj_user";
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){
				User user = new User();
				String name = rs.getString("name");
				String pass = rs.getString("pass");
				user.setName(name);
				user.setPass(pass);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public User getUser(String name){
		User user = null;
		try {
			
			String sql = "select pass,tel,address from wsj_user where name='"+name+"'";
			
			ResultSet rs = db.executeQuery(sql);
			while(rs.next()){
				user = new User();
				String pass = rs.getString("pass");
				String tel = rs.getString("tel");
				String addrss = rs.getString("address");
				user.setName(name);
				user.setPass(pass);
				user.setTel(tel);
				user.setAddress(addrss);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
