package test.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbcpBean {
	private Connection conn;
	
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			//Servers/context.xml문서에 설정된 jdbc/myoracle이라는 이름의 datasource를 얻어온다.
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			//얻어온 datasource객체를 이용해서 Connection객체의 참조값을 얻어와서 필드에 저장
			conn = ds.getConnection();
			//예외가 발생하지 않고 여기까지 실행의 흐름이 넘어온다면 성공
			System.out.println("Connection 얻어오기 성공");
		}catch(NamingException ne) {
			ne.printStackTrace();
		}catch(SQLException se) {
			se.printStackTrace();
			se.getMessage();
		}
	}
	//Connection 객체를 리턴해주는 메서드
	public Connection getConn() {
		return conn;
	}
}