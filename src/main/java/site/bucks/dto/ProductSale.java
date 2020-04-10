package site.bucks.dto;

public class ProductSale {
	Sale sale;
	Item item;
	
	public ProductSale() {
		// TODO Auto-generated constructor stub
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
	
	@Override
	public String toString() {
		return item.getItemCode()+sale.getSaleProduct()+sale.getSaleQty();
	}
}
