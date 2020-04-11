package site.bucks.dto;

/*
 
이름         널? 유형           
---------- -- ------------ 
ITEM_NUM      VARCHAR2(50) 
STORE_ID      NUMBER       
ITEM_QTY      NUMBER       
ITEM_PRICE    NUMBER       
MIN_QTY       NUMBER 

 */

public class StoreItem {
	private String itemNum;
	private int storeId;
	private int itemQty;
	private int itemPrice;
	private int minQty;
	
	public StoreItem() {
		// TODO Auto-generated constructor stub
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getMinQty() {
		return minQty;
	}

	public void setMinQty(int minQty) {
		this.minQty = minQty;
	}
	
	
	
}
