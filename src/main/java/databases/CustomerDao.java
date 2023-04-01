package databases;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDao {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/customerrecord";
		String username = "root";
		String password = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public String registerCustomer(String username, String email,  String pass) {
			
			try {
				Connection con = getConnection();
				
				String query = "INSERT INTO registration values(?,?,?)";
	
				
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, username);
				st.setString(2, email);
				st.setString(3, pass);
				int rows = st.executeUpdate();
				if(rows >= 1) {
					System.out.println("Successfully inserted " + rows + " rows.");
					return "Successfully Added";
				}
				else {
					System.out.println("Failed to insert rows.");
					return "something is missing";
				}
			} catch (ClassNotFoundException e) {
				System.out.println("ClassNotFoundException "+e.getMessage());
				return e.getMessage();
			} catch (SQLException e) {
				System.out.println("SQLException " + e.getMessage());
				return e.getMessage();
				
			}
		
		}
	
		public boolean loginCustomer(String email, String pass) {
		    try {
		        Connection con = getConnection();
	
		        String query = "SELECT * FROM registration WHERE email = ? AND password = ?";
	
		        PreparedStatement st = con.prepareStatement(query);
		        st.setString(1, email);
		        st.setString(2, pass);
	
		        ResultSet rs = st.executeQuery();
		        return rs.next();
		        
		        
		    } catch (ClassNotFoundException e) {
		        System.out.println(e.getMessage()); 
		    } catch (SQLException e) {
		        System.out.println(e.getMessage());
		    }
			return false;
		
	}

	
}

	