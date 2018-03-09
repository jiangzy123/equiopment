package com.ifly.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbHelper {
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String JDBC_URL;
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public DbHelper() {
		DbHelper.JDBC_URL = "jdbc:oracle:thin:@172.16.19.111:1521:orcl";
	}
	
	//注册驱动
	static{
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("驱动不存在，请添加驱动包");
			e.printStackTrace();
		}
	}
	
	/**
	 * 建立连接
	 * @return
	 */
	public Connection getConn(){
		try {
			conn = DriverManager.getConnection(JDBC_URL,"student","student");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 增删改
	 * @param sql
	 * @param parms
	 * @return
	 */
	public int executeUpdate(String sql,Object... parms){
		int rlt = -1;
		getConn();
		try {
			stmt = conn.prepareStatement(sql);
			putParams(parms, stmt);
			
			rlt = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rlt;
	}
	
	/**
	 * 查询
	 * @param sql
	 * @param params
	 * @return
	 */
	public ResultSet executeQuery(String sql, Object... params) {
		try {
			// 2.获取连接
			getConn();
			stmt = conn.prepareStatement(sql);
			putParams(params, stmt);
			// 3.执行事务
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 遍历设置PreparedStatement属性
	 * @param params
	 * @param stmt
	 * @throws SQLException
	 */
	private void putParams(Object[] params, PreparedStatement stmt) throws SQLException {
		if (params != null) {
			for (int i = 1; i <= params.length; i++) {
				stmt.setObject(i, params[i - 1]);
			}
		}
	}
	
	public void close(){
		try {
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}
