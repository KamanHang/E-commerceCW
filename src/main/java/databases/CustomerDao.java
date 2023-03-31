package databases;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CustomerDao {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/cutomerRecord";
		String username = "root";
		String password = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}

	
}

	