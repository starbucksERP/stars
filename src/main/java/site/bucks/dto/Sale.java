package site.bucks.dto;

/*	판매 테이블
 
이름           널?       유형            
------------ -------- ------------- 
SALE_NO      NOT NULL NUMBER        
STORE_ID              NUMBER        
SALE_PRODUCT          VARCHAR2(100) 
SALE_QTY              NUMBER        
SALE_DATE             DATE  

 */

public class Sale {
	private int saleNo;
	private int storeId;
	private String saleProduct;
	private int saleQty;
	private String saleDate;
	
	public Sale() {
		// TODO Auto-generated constructor stub
	}

	public int getSaleNo() {
		return saleNo;
	}

	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	
	public int getstoreId() {
		return storeId;
	}

	public void setstoreId(int storeId) {
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

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}
	
}
