package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CustomerDao {
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/customerrecord";
		String username = "root";
		String password = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public String registerCustomer(Customer customer) {
			
			try {
				Connection con = getConnection();
				
				String query = "INSERT INTO registration values(?,?,?,?)";
	
				
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, customer.getUsername());
				st.setString(2, customer.getEmail());
				st.setString(3, customer.getPassword());
				st.setString(4, customer.getImagePath());
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
		
		public boolean loginAdmin(String email, String pass) {
		    try {
		        Connection con = getConnection();
	
		        String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
	
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
		
		public ArrayList<Product> fetchProductDetails(){
			ArrayList<Product> productList = new ArrayList<>();
			Connection con = null;
			try {
				con = getConnection();
				String query = "select * from product";
				PreparedStatement st = con.prepareStatement(query);
				ResultSet table = st.executeQuery();
				while(table.next()) {
					String productID = table.getString(1);
					String productImage = table.getString(2);
					String productName = table.getString(3);
					String productBrand = table.getString(4);
					String productDescription = table.getString(5);
					String productRating = table.getString(6);
					String productPrice = table.getString(7);
					String productCategory = table.getString(8);

					
					System.out.println(productID);
					
					
					Product product = new Product(productID,productImage,productName,productBrand,productDescription,productRating,productPrice,productCategory);
					productList.add(product);		
				}
				
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return productList;
			
						
		}
		
public String addProduct(Product product) {
			
			try {
				Connection con = getConnection();
				
				String query = "INSERT INTO product values(?,?,?,?,?,?,?,?)";
	
				
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, product.getProductID());
				st.setString(2, product.getProductImage());
				st.setString(3, product.getProductName());
				st.setString(4, product.getProductBrand());
				st.setString(5, product.getProductDescription());
				st.setString(6, product.getProductRating());
				st.setString(7, product.getProductPrice());
				st.setString(8, product.getProductCategory());

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
		
		public Product getProductRecordById(String productID) {
			Connection con = null;
			Product product = null;
			try {
				con = getConnection();
				String query = "select * from product where productID=?";
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1,productID);
				ResultSet table = st.executeQuery();
				while(table.next()) {
					String productID2 = table.getString(1);
					String productImage = table.getString(2);
					String productName = table.getString(3);
					String productBrand = table.getString(4);
					String productDescription = table.getString(5);
					String productRating = table.getString(6);
					String productPrice = table.getString(7);
					String productCategory = table.getString(8);
					
					product = new Product(productID2,productImage,productName,productBrand,productDescription,productRating,productPrice,productCategory);
							
				}			
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return product;
		}
		
		public String updateProduct(Product product) {
			String message = "";
			try {
				
				Connection con =  getConnection();
				String query = "UPDATE product SET productImage=?, productName=?, productBrand=?, productDescription=?, productRating=?, productPrice=?, productCategory=? where productID=?";
				PreparedStatement st = con.prepareStatement(query);
				
				st.setString(1, product.getProductImage());
				st.setString(2, product.getProductName());
				st.setString(3, product.getProductBrand());
				st.setString(4, product.getProductDescription());
				st.setString(5, product.getProductRating());
				st.setString(6, product.getProductPrice());
				st.setString(7, product.getProductCategory());
				st.setString(8, product.getProductID());

				int rows = st.executeUpdate();
				if(rows >= 1) {
					message = "Successfully Updated";
				}
				
				System.out.println(message);
				con.close();	
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
				message = e.getMessage();
			}
			return message;	
		}
		
		public int deleteProduct(String productID) {
			Connection con = null;
			int rows = -1;
			try {
				con = getConnection();
				String query = "DELETE from product where productID=?";
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1,productID);
				rows = st.executeUpdate();			
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return rows;
		}
		
	

	
}

	