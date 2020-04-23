package site.bucks.dto;


public class Account {

//	지점매입 + 본사매출 공통 필드명
	private String historyDate;   // 일자  
	private int storeId;          // 매장코드
	private String itemNum;       // 물품코드
	private String itemName;      // 물품명
	private int itemSprice;       // 본사판매가격(본사매출), 지점구매가격(지점매입)
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public String getHistoryDate() {
		return historyDate;
	}

	public void setHistoryDate(String historyDate) {
		this.historyDate = historyDate;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
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

	public int getItemSprice() {
		return itemSprice;
	}

	public void setItemSprice(int itemSprice) {
		this.itemSprice = itemSprice;
	}
	
	
	
}
