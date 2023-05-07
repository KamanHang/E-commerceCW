package model;

public class Customer {
	private String username;
	private String email;
	private String password;
	private String imagePath;
	public Customer(String username, String email, String password, String imagePath) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.imagePath = imagePath;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	
	
	
	
}