package com.ifly.contro;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ifly.dao.DbHelper;
import com.ifly.page.PageInfo;
import com.ifly.pojo.Addr;
import com.ifly.pojo.User;
import com.ifly.pojo.UserInfo;

/**
 * 员工信息表
 * @author Administrator
 *
 */
public class UserInfoShow {
	private DbHelper db = new DbHelper();
	
	public List<UserInfo> getAllUserInfos(){
		List<UserInfo> userInfos=null;
		try{
			userInfos=new ArrayList<>();
			String sql="select name,true_name,sex,brithday,sid,phone,email from JJ_USER";
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				UserInfo uf=new UserInfo();
				uf.setName(rs.getString("name"));
				uf.setTrue_name(rs.getString("true_name"));
				uf.setSex(rs.getString("sex"));
				uf.setBrithday(rs.getString("brithday"));
				uf.setSid(rs.getString("sid"));
				uf.setPhone(rs.getString("phone"));
				uf.setEmail(rs.getString("email"));
				userInfos.add(uf);
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return userInfos;
	}
	
	/**
	 * 员工信息表分页
	 * @author Administrator
	 *
	 */
public PageInfo queryPage(PageInfo page){
	List<UserInfo> users=null;
	String sql="select   name,true_name,sex,brithday,sid,phone,email from (select rownum as rr,name,true_name,sex,brithday,sid,phone,email from JJ_USER where rownum <= ?) T where T.rr > ?";
	
	try {
		users=new ArrayList<>();
		
		ResultSet rs=db.executeQuery(sql,page.getCurrentPage()*page.getPageCount(),(page.getCurrentPage()-1)*page.getPageCount());
		
		while(rs.next()){
			UserInfo uf=new UserInfo();
			uf.setName(rs.getString("name"));
			uf.setTrue_name(rs.getString("true_name"));
			uf.setSex(rs.getString("sex"));
			uf.setBrithday(rs.getString("brithday"));
			uf.setSid(rs.getString("sid"));
			uf.setPhone(rs.getString("phone"));
			uf.setEmail(rs.getString("email"));
			users.add(uf);
		}
		page.setValue(users);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.close();
	}
	return page;
}

public void add(UserInfo userInfo){
	String sql="insert into JJ_USER values(?,?,?,?,?,?,?)";
	int rl=db.executeUpdate(sql, userInfo.getName(),userInfo.getTrue_name(),userInfo.getSex(),userInfo.getBrithday(),userInfo.getSid(),userInfo.getPhone(),userInfo.getEmail());		
	if(rl!=-1){
		System.out.println("成功");
	}
}

public void delete(String id){
	String sql="delete from JJ_USER where sId=?";
	int  result=db.executeUpdate(sql,id);
	if(result!=-1){
		System.out.println("删除成功");
	}
}

public void modifyAddr(String id,UserInfo userInfo){
	String sql="update JJ_USER set name=?, true_name=?,sex=?,brithday=?,phone=?,email=? where sid=?";
	int  result=db.executeUpdate(sql,userInfo.getName(),userInfo.getTrue_name(),userInfo.getSex(),userInfo.getBrithday(),userInfo.getPhone(),userInfo.getEmail(),id);
	if(result!=-1){
		System.out.println("修改成功");
	}else{
		System.out.println("===修改失败===");
	}
}

/**
 * 根据用户名和真实姓名查找员工信息
 * @param name 用户名
 * @param t_name
 * @return
 */
public List<UserInfo> query(String name,String t_name){
	
	List<UserInfo> userInfos=null;
	try{
		userInfos=new ArrayList<>();
		String sql="select   name,true_name,sex,brithday,sid,phone,email from JJ_USER where name=? and true_name=?";
		ResultSet rs=db.executeQuery(sql,name,t_name);
		while(rs.next()){
			UserInfo uf=new UserInfo();
			uf.setName(rs.getString("name"));
			uf.setTrue_name(rs.getString("true_name"));
			uf.setSex(rs.getString("sex"));
			uf.setBrithday(rs.getString("brithday"));
			uf.setSid(rs.getString("sid"));
			uf.setPhone(rs.getString("phone"));
			uf.setEmail(rs.getString("email"));
			userInfos.add(uf);
			
		}
	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		db.close();
	}
	return userInfos;
	
}
	
//	public static void main(String[] args) {
//	List<UserInfo> users=new ArrayList<>();
//	UserInfoShow u=new UserInfoShow();
//	users=u.getAllUserInfos();
//	for(UserInfo u1:users){
//		System.out.println(u1);
//	}
	
//}
}
