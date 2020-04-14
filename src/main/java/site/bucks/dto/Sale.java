package site.bucks.dto;

/*	판매 테이블
 
이름           널?       유형            
------------ -------- ------------- 
SALE_NO      NOT NULL NUMBER        
STORE_ID              NUMBER        
SALE_PRODUCT          VARCHAR2(100) 
SALE_QTY              NUMBER        
SALE_PRICE_SUM		  NUMBER
SALE_DATE             DATE  

 */

public class Sale {
	private int saleSeq;
	private int storeId;
	private String saleProduct;
	private int saleQty;
	private int salePriceSum;
	private String saleDate;
	
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
	
	
	
}
