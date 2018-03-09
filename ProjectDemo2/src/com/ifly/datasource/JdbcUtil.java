package com.ifly.datasource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtil {
	private SimpleDataSource dataSource = SimpleDataSource.getInstance();
	
	private static JdbcUtil instance = new JdbcUtil();
	public static JdbcUtil getInstance(){
		return instance;
	}
	
	ThreadLocal<Connection> locale = new ThreadLocal<Connection>();
	// ͬһ���߳��� �洢ֵ��Ψһ�ģ������ظ��洢
	// key --->Thread  value ---> collection
	
	// ���⣿
	// Connection conn = null;
	
	// ��������
	// --> �����߳�ͬʱ������һ�� ����
	
	public int execute(String sql, Object...objects ) throws SQLException{
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (objects != null){
			for (int i = 0; i < objects.length; i ++){
				pstmt.setObject(i+1, objects[i]);
			}
		}
		return pstmt.executeUpdate();
	}
	
	public ResultSet query(String sql, Object...objects ) throws SQLException{
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (objects != null){
			for (int i = 0; i < objects.length; i ++){
				pstmt.setObject(i+1, objects[i]);
			}
		}
		return pstmt.executeQuery();
	}
	
	public void close(){
		Connection conn = locale.get();
		if (conn != null){
			dataSource.freeConn(conn);
			locale.remove();
		}
	}
	
	
	public void closeTransaction(){
		dataSource.freeConn(locale.get());
	}
	
	public Connection getConnection() throws SQLException{
		Connection conn = locale.get();
		if (conn == null){
			conn = dataSource.getConnection();
			locale.set(conn);
		}
		return conn;
	}
	
	public void beginTransaction() throws SQLException{
		Connection conn = getConnection();
		conn.setAutoCommit(false);
	}
	
	public void rollbackTransaction() throws SQLException{
		locale.get().rollback();
	}
	
	public void commitTransaction() throws SQLException{
		locale.get().commit();
	}
}
