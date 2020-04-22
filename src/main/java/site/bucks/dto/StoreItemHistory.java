package site.bucks.dto;

/*
이름                널? 유형            
----------------- -- ------------- 
STORE_HISTORY_SEQ    NUMBER        
STORE_ID             NUMBER        
REQUEST_NUM          VARCHAR2(50)  
ITEM_NUM             VARCHAR2(50)  
ITEM_NAME            VARCHAR2(100) 
ITEM_STATE           NUMBER        
ITEM_QTY             NUMBER        
HISTORY_DATE         DATE   
 */

public class StoreItemHistory {
	private int storeHistorySeq;
	private int storeId;
	private String requestNum;
	private String itemNum;
	private String itemName;
	private int itemState;
	private int itemQty;
	private String historyDate;
	
	public StoreItemHistory() {
		// TODO Auto-generated constructor stub
	}

	public int getStoreHistorySeq() {
		return storeHistorySeq;
	}

	public void setStoreHistorySeq(int storeHistorySeq) {
		this.storeHistorySeq = storeHistorySeq;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(String requestNum) {
		this.requestNum = requestNum;
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemState() {
		return itemState;
	}

	public void setItemState(int itemState) {
		this.itemState = itemState;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}

	public String getHistoryDate() {
		return historyDate;
	}

	public void setHistoryDate(String historyDate) {
		this.historyDate = historyDate;
	}
	
}
