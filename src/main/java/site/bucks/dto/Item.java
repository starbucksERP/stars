package site.bucks.dto;

/*
 
 이름             널?       유형            
-------------- -------- ------------- 
ITEM_CODE      NOT NULL VARCHAR2(50)  
ITEM_NAME      NOT NULL VARCHAR2(100) 
ITEM_PRICE     NOT NULL NUMBER        
ITEM_PRICE_BUY NOT NULL NUMBER        
ITEM_QTY       NOT NULL NUMBER(4)     
ITEM_MIN_QTY        NOT NULL NUMBER(4)     
ITEM_ACCOUNT   NOT NULL VARCHAR2(50)  

 */

public class Item {
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private int itemPriceBuy;
	private int itemQty;
	private int itemMinQty;
	private String itemAccount;
	
	public Item() {
		// TODO Auto-generated constructor stub
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemPriceBuy() {
		return itemPriceBuy;
	}

	public void setItemPriceBuy(int itemPriceBuy) {
		this.itemPriceBuy = itemPriceBuy;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}

	public int getItemMinQty() {
		return itemMinQty;
	}

	public void setItemMinQty(int itemMinQty) {
		this.itemMinQty = itemMinQty;
	}

	public String getItemAccount() {
		return itemAccount;
	}

	public void setItemAccount(String itemAccount) {
		this.itemAccount = itemAccount;
	}
	
}
