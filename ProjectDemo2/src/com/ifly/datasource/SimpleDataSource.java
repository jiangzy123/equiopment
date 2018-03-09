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

//1、实现DataSource接口
public class SimpleDataSource implements DataSource {
	private static final String username = "teacher";
	private static final String password = "teacher";
	
	// username_password  多数据源
	private static final String url = "jdbc:oracle:thin:@172.16.19.111:1521:orcl";
	
	//5、连接是有上限 连接是不能无限制创建的
	private static final int poolSize = 10;
	private static final int initPoolSize = 5;
	private static int currentSize = 0;

	//3、创建一个容器当作池子
	List<Connection> pool = Collections
			.synchronizedList(new ArrayList<Connection>(poolSize));
	
	private static SimpleDataSource instance = new SimpleDataSource();
	
	private SimpleDataSource(){
		init();
	}

	static {
		// 1、注册驱动
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static SimpleDataSource getInstance(){
		return instance;
	}
	
	//4、拥有连接的资源，需要一个初始化方法 创建初始化连接
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

	//2、实现里面抽象方法
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
