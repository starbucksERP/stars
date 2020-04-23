package site.bucks.dto;

/*	
 
이름           널?       유형            
------------ -------- ------------- 
SALE_SEQ     NOT NULL NUMBER        
STORE_ID     NOT NULL NUMBER        
SALE_PRODUCT NOT NULL VARCHAR2(100) 
SALE_QTY     NOT NULL NUMBER        
SALE_PRICE   NOT NULL NUMBER        
SALE_DATE    NOT NULL DATE  
 */

public class Sale {
	private int saleSeq;
	private int storeId;
	private String saleProduct;
	private double saleQty;
	private int salePrice;
	private String saleDate;
	
//	검색용
	private String saleDatePair;
	private String saleQtyPair;
	
	public Sale() {
		// TODO Auto-generated constructor stub
	}

	public int getSaleSeq() {
		return saleSeq;
	}

	public void setSaleSeq(int saleSeq) {
		this.saleSeq = saleSeq;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getSaleProduct() {
		return saleProduct;
	}

	public void setSaleProduct(String saleProduct) {
		this.saleProduct = saleProduct;
	}

	public double getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(double saleQty) {
		this.saleQty = saleQty;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public String getSaleDatePair() {
		return saleDatePair;
	}

	public void setSaleDatePair(String saleDatePair) {
		this.saleDatePair = saleDatePair;
	}

	public String getSaleQtyPair() {
		return saleQtyPair;
	}

	public void setSaleQtyPair(String saleQtyPair) {
		this.saleQtyPair = saleQtyPair;
	}

	
}
