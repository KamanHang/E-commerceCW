package model;

public class Product {
	private String productID;
	private String productImage;
	private String productName;
	private String productBrand;
	private String productDescription;
	private String productRating;
	private String productPrice;
	private String productCategory;
	
	
	public Product(String productID, String productImage, String productName,String productBrand, String productDescription,
			 String productRating, String productPrice, String productCategory) {
		this.productID = productID;
		this.productImage = productImage;
		this.productName = productName;
		this.productBrand = productBrand;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productCategory = productCategory;
		this.productRating = productRating;
	}
	
	
	public String getProductID() {
		return productID;
	}


	public void setProductID(String productID) {
		this.productID = productID;
	}


	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	public String getProductRating() {
		return productRating;
	}
	public void setProductRating(String productRating) {
		this.productRating = productRating;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	
	
}
