package site.bucks.dto;

/*
 이름                 널?       유형           
------------------ -------- ------------ 
ITEM_CODE                   VARCHAR2(50) 
STORE_CODE                  NUMBER       
STORE_ITEM_PRICE   NOT NULL NUMBER       
STORE_ITEM_QTY     NOT NULL NUMBER(4)    
STORE_ITEM_MIN_QTY NOT NULL NUMBER(4)    

 */

public class StoreItem {
	private String itemCode;
	private String storeCode;
	private String storeItemPrice;
	private String storeItemQty;
	private String storeItemMinQty;

	public StoreItem() {
		// TODO Auto-generated constructor stub
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}

	public String getStoreItemPrice() {
		return storeItemPrice;
	}

	public void setStoreItemPrice(String storeItemPrice) {
		this.storeItemPrice = storeItemPrice;
	}

	public String getStoreItemQty() {
		return storeItemQty;
	}

	public void setStoreItemQty(String storeItemQty) {
		this.storeItemQty = storeItemQty;
	}

	public String getStoreItemMinQty() {
		return storeItemMinQty;
	}

	public void setStoreItemMinQty(String storeItemMinQty) {
		this.storeItemMinQty = storeItemMinQty;
	}
	
	
}
