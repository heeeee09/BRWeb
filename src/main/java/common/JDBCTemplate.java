package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemplate {

	private static JDBCTemplate instance;
	private static Connection conn;

	public static JDBCTemplate getInstance() {
		if (instance == null) {
			instance = new JDBCTemplate();
		}
		return instance;
	}

	public Connection createConnection() {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "BR";
		String password = "BR";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public void close(Connection conn) {
		if (conn != null) {
			try {
				if (!conn.isClosed())
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void commit(Connection conn) {
		if (conn != null) {
			try {
				if (!conn.isClosed())
					conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void rollback(Connection conn) {
		if (conn != null) {
			try {
				if (!conn.isClosed())
					conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
