package site.bucks.dto;

/*
 
이름         널?       유형           
---------- -------- ------------ 
ITEM_NUM   NOT NULL VARCHAR2(50) 
STORE_ID   NOT NULL VARCHAR2(20) 
ITEM_NAME  NOT NULL VARCHAR2(20) 
ITEM_QTY   NOT NULL NUMBER       
MIN_QTY    NOT NULL NUMBER       
ITEM_PRICE NOT NULL NUMBER  

 */

public class StoreItem {
	private String itemNum;
	private int storeId;
	private String itemName;
	private double itemQty;
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public double getItemQty() {
		return itemQty;
	}

	public void setItemQty(double itemQty) {
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
