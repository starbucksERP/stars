package site.bucks.dto;

/*
 �̸�            ��?       ����           
------------- -------- ------------ 
HISTORY_SEQ   NOT NULL NUMBER       
REQUEST_NUM   NOT NULL VARCHAR2(50) 
ITEM_NUM      NOT NULL VARCHAR2(50) 
ITEM_NAME     NOT NULL VARCHAR2(20)  
ITEM_STATE    NOT NULL NUMBER       
ITEM_QTY      NOT NULL NUMBER       
HISTORY_DATE  NOT NULL DATE         
PURCHASE_TYPE NOT NULL NUMBER       
HISTORY_OWNER NOT NULL VARCHAR2(20) 
 */
public class ItemHistory {
	
	private int historySeq;
	private String requestNum;
	private String itemNum;
	private String itemName;
	private int itemState;
	private int itemQty;
	private String historyDate;
	private String historyDateTwo;
	private int purchaseType;
	private String historyOwner;
	
	public ItemHistory() {
		// TODO Auto-generated constructor stub
	}

	public int getHistorySeq() {
		return historySeq;
	}

	public void setHistorySeq(int historySeq) {
		this.historySeq = historySeq;
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

	public int getPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(int purchaseType) {
		this.purchaseType = purchaseType;
	}

	public String getHistoryOwner() {
		return historyOwner;
	}

	public void setHistoryOwner(String historyOwner) {
		this.historyOwner = historyOwner;
	}

	public String getHistoryDateTwo() {
		return historyDateTwo;
	}

	public void setHistoryDateTwo(String historyDateTwo) {
		this.historyDateTwo = historyDateTwo;
	}


	
	
	
	
	

}
