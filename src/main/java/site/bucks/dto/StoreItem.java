package site.bucks.dto;

import java.util.List;

/*이름             널?       유형            
-------------- -------- ------------- 
STORE_ITEM_SEQ NOT NULL NUMBER        
ITEM_NUM       NOT NULL VARCHAR2(50)  
ITEM_NAME      NOT NULL VARCHAR2(100) 
STORE_ID       NOT NULL NUMBER        
ITEM_QTY       NOT NULL NUMBER        
MIN_QTY                 NUMBER        
ITEM_PRICE     NOT NULL NUMBER        
ITEM_USAGE     NOT NULL NUMBER 
*/
public class StoreItem {
	private int storeItemSeq;
	private String itemNum;
	private String itemName;
	private int storeId;
	private double itemQty;
	private int minQty;
	private int itemPrice;
	private int itemUsage;
	
	private double itemQtyPair;
	private int itemPricePair;
	private List<String> categorys;
	private List<String> items;
	public StoreItem() {
		// TODO Auto-generated constructor stub
	}

	public List<String> getItems() {
		return items;
	}

	public void setItems(List<String> items) {
		this.items = items;
	}

	public List<String> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<String> categorys) {
		this.categorys = categorys;
	}

	public double getItemQtyPair() {
		return itemQtyPair;
	}

	public void setItemQtyPair(double itemQtyPair) {
		this.itemQtyPair = itemQtyPair;
	}

	public int getItemPricePair() {
		return itemPricePair;
	}

	public void setItemPricePair(int itemPricePair) {
		this.itemPricePair = itemPricePair;
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

	public int getItemUsage() {
		return itemUsage;
	}

	public void setItemUsage(int itemUsage) {
		this.itemUsage = itemUsage;
	}

	public int getStoreItemSeq() {
		return storeItemSeq;
	}

	public void setStoreItemSeq(int storeItemSeq) {
		this.storeItemSeq = storeItemSeq;
	}

	
	
}
