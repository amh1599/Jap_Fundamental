package kr.or.kpc.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnLocator {
	public static Connection getConnect() {
		DataSource ds = null;
		Connection con = null;
		
		try {
			Context context = new InitialContext();
			
			// java:comp/env => 고정
			// jdbc/lpc => comtext.xml의 name 속성 값과 일치해야 함.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/kpc");
			// 이미 만들어져 있는 Connection 객체를 가져온다.
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
