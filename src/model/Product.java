package model;

public class Product {

	public int id;
	public String name;
	public float cost;
	public float shippingCost;
	public String imagePath;
	public float ranking;
	public String review;
	public String category;
	public String description;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int quantity;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Product(String name, float cost, float shippingCost,
			String imagePath, float ranking, String review, String productId ,String category) {
		this.name = name;
		this.cost = cost;
		this.shippingCost = shippingCost;
		this.imagePath = imagePath;
		this.ranking = ranking;
		this.review = review;
		this.productId = productId;
		this.category=category;
	}

	public Product() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	private String productId;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public float getShippingCost() {
		return shippingCost;
	}
	public void setShippingCost(float shippingCost) {
		this.shippingCost = shippingCost;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public float getRanking() {
		return ranking;
	}
	public void setRanking(float ranking) {
		this.ranking = ranking;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}

}