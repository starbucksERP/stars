package site.bucks.dto;

public class SaleItem {
	private Sale sale;
	private StoreItem storeItem;
	private ProductRecipe productRecipe;
	
	public SaleItem() {
		// TODO Auto-generated constructor stub
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public StoreItem getStoreItem() {
		return storeItem;
	}

	public void setStoreItem(StoreItem storeItem) {
		this.storeItem = storeItem;
	}

	public ProductRecipe getProductRecipe() {
		return productRecipe;
	}

	public void setProductRecipe(ProductRecipe productRecipe) {
		this.productRecipe = productRecipe;
	}

	
	
	
}
