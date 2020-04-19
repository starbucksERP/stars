package site.bucks.dto;

/*	판매 테이블
 
이름             널?       유형           
-------------- -------- ------------ 
SALE_SEQ       NOT NULL NUMBER       
STORE_ID       NOT NULL NUMBER       
SALE_PRODUCT   NOT NULL VARCHAR2(50) 
SALE_QTY       NOT NULL NUMBER       
SALE_PRICE_SUM NOT NULL NUMBER       
SALE_DATE               DATE  

 */

public class Sale {
	private int saleSeq;
	private int storeId;
	private String saleProduct;
	private int saleQty;
	private int salePriceSum;
	private String saleDate;
	
//	검색용
	private String saleDate1;
	private String saleDate2;
	private String saleQty1;
	private String saleQty2;
	private String category;
	private String subCategory;
	
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

	public int getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(int saleQty) {
		this.saleQty = saleQty;
	}

	public int getSalePriceSum() {
		return salePriceSum;
	}

	public void setSalePriceSum(int salePriceSum) {
		this.salePriceSum = salePriceSum;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
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


	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
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
	
	
	
}
