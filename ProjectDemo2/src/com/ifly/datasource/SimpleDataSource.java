package com.ifly.datasource;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

//1��ʵ��DataSource�ӿ�
public class SimpleDataSource implements DataSource {
	private static final String username = "teacher";
	private static final String password = "teacher";
	
	// username_password  ������Դ
	private static final String url = "jdbc:oracle:thin:@172.16.19.111:1521:orcl";
	
	//5�������������� �����ǲ��������ƴ�����
	private static final int poolSize = 10;
	private static final int initPoolSize = 5;
	private static int currentSize = 0;

	//3������һ��������������
	List<Connection> pool = Collections
			.synchronizedList(new ArrayList<Connection>(poolSize));
	
	private static SimpleDataSource instance = new SimpleDataSource();
	
	private SimpleDataSource(){
		init();
	}

	static {
		// 1��ע������
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static SimpleDataSource getInstance(){
		return instance;
	}
	
	//4��ӵ�����ӵ���Դ����Ҫһ����ʼ������ ������ʼ������
	private void init() {
		try {
			for (int i = 0; i < initPoolSize; i++) {
				pool.add(DriverManager.getConnection(
						url, username,
						password));
			}
			
			currentSize = pool.size();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//2��ʵ��������󷽷�
	@Override
	public PrintWriter getLogWriter() throws SQLException {
		return null;
	}

	@Override
	public void setLogWriter(PrintWriter out) throws SQLException {

	}

	@Override
	public void setLoginTimeout(int seconds) throws SQLException {

	}

	@Override
	public int getLoginTimeout() throws SQLException {
		return 0;
	}

	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		return null;
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		return null;
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return false;
	}

	@Override
	public Connection getConnection() throws SQLException {
		synchronized (pool) {
			if (pool.size() > 0){
				return pool.remove(0);
			}
			
			if (currentSize < poolSize){
				Connection con = DriverManager.getConnection(
						url, username,
						password);
				currentSize ++;
				return con;
			}
			
			try {
				pool.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			return pool.remove(0);
		}
	}

	@Override
	public Connection getConnection(String username, String password)
			throws SQLException {
		return this.getConnection();
	}
	
	public void freeConn(Connection conn){
		synchronized (pool) {
			pool.add(conn);
			pool.notify();
		}
		
	}
}
