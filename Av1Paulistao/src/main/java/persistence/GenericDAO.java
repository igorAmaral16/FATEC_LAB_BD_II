package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GenericDAO {

	private Connection con;

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		String hostName = "localhost";
		String dbName = "trabalho1";
		String user = "sa";
		String senha = "123456";
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		con = DriverManager.getConnection(String.format(
				"jdbc:jtds:sqlserver://%s:57126;databaseName=%s;user=%s;password=%s;", hostName, dbName, user, senha));

		return con;
	}

}
