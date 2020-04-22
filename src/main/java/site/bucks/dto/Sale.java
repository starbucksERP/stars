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
	private String saleDate1;
	private String saleDate2;
	private String saleQty1;
	private String saleQty2;
	private String saleCategory;
	private String saleSubCategory;
	
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

	public String getSaleDate1() {
		return saleDate1;
	}

	public void setSaleDate1(String saleDate1) {
		this.saleDate1 = saleDate1;
	}

	public String getSaleDate2() {
		return saleDate2;
	}

	public void setSaleDate2(String saleDate2) {
		this.saleDate2 = saleDate2;
	}

	public String getSaleQty1() {
		return saleQty1;
	}

	public void setSaleQty1(String saleQty1) {
		this.saleQty1 = saleQty1;
	}

	public String getSaleQty2() {
		return saleQty2;
	}

	public void setSaleQty2(String saleQty2) {
		this.saleQty2 = saleQty2;
	}

	public String getSaleCategory() {
		return saleCategory;
	}

	public void setSaleCategory(String saleCategory) {
		this.saleCategory = saleCategory;
	}

	public String getSaleSubCategory() {
		return saleSubCategory;
	}

	public void setSaleSubCategory(String saleSubCategory) {
		this.saleSubCategory = saleSubCategory;
	}

	
	
	
	
	
}
