package site.bucks.dto;


public class Account {

//	�������� + ������� ���� �ʵ��
	private String historyDate;   // ����  
	private int storeId;          // �����ڵ�
	private String itemNum;       // ��ǰ�ڵ�
	private String itemName;      // ��ǰ��
	private int itemSprice;       // �����ǸŰ���(�������), �������Ű���(��������)
	
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
