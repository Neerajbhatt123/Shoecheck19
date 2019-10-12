package cart;

import product.Product;

public class Cart {
	private int id, productId,
	userId,Quantity;
	
	Product product;
	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", productId=" + productId + ", userId=" + userId + ", Quantity=" + Quantity + "]";
	}

	public Cart(int id, int productId, int userId, int quantity) {
		
		this.id = id;
		this.productId = productId;
		this.userId = userId;
		Quantity = quantity;
	}

	public Cart() {
		
	}

	public Cart(int productId, int userId, int quantity) {
		
		this.productId = productId;
		this.userId = userId;
		Quantity = quantity;
	}
	
	

}
