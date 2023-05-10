package model;





public class Cart extends Product{
	private int quantity;
	

	

	public Cart(String productID, String productImage, String productName, String productBrand,
			String productDescription, String productRating, String productPrice, String productCategory,
			int quantity) {
		super(productID, productImage, productName, productBrand, productDescription, productRating, productPrice,
				productCategory);
		this.quantity = quantity;
	}



	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}