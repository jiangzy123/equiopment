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
	
	//ע������
	static{
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("���������ڣ������������");
			e.printStackTrace();
		}
	}
	
	/**
	 * ��������
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
	 * ��ɾ��
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
	 * ��ѯ
	 * @param sql
	 * @param params
	 * @return
	 */
	public ResultSet executeQuery(String sql, Object... params) {
		try {
			// 2.��ȡ����
			getConn();
			stmt = conn.prepareStatement(sql);
			putParams(params, stmt);
			// 3.ִ������
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * ��������PreparedStatement����
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
