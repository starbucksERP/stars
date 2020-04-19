package site.bucks.dto;

import java.util.List;

/*
 		���� ���̺� DTO
 		
�̸�            ��?       ����            
------------- -------- -------------  
STORE_ID      NOT NULL NUMBER                       primary key
STORE_NAME    NOT NULL VARCHAR2(50)  
STORE_ADDRESS NOT NULL VARCHAR2(200) 
STORE_OWNER   NOT NULL VARCHAR2(50)  
STORE_PHONE   NOT NULL VARCHAR2(100) 
STORE_STATE   NOT NULL NUMBER                       0: ����  /  1: ����  /  9: ����
STORE_OPEN    NOT NULL VARCHAR2(50)                 ������ 
STORE_CLOSE            VARCHAR2(50)                 �����

*/

public class Store {
	private int storeId;
	private String storeName;
	private String storeAddress;
	private String storeOwner;
	private String storePhone;
	private int storeState;
	private String storeOpen;
	private String storeClose;
	
	private List<Integer> states;	// üũ�ڽ� �˻���
	
	
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public int getStoreId() {
		return storeId;
	}


	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getStoreAddress() {
		return storeAddress;
	}


	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}


	public String getStoreOwner() {
		return storeOwner;
	}



	public void setStoreOwner(String storeOwner) {
		this.storeOwner = storeOwner;
	}


	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public int getStoreState() {
		return storeState;
	}


	public void setStoreState(int storeState) {
		this.storeState = storeState;
	}


	public String getstoreOpen() {
		return storeOpen;
	}


	public void setstoreOpen(String storeOpen) {
		this.storeOpen = storeOpen;
	}
	
	public String getStoreClose() {
		return storeClose;
	}

	public void setStoreClose(String storeClose) {
		this.storeClose = storeClose;
	}
	

	public List<Integer> getStates() {
		return states;
	}

	public void setStates(List<Integer> states) {
		this.states = states;
	}

	//	�׽�Ʈ������ ����
	@Override
	public String toString() {
		return storeId+", "+storeName+", "+storeAddress+", "+storeOwner+", "+storePhone+", "+storeState+", "+storeOpen+", "+storeClose;
	}

	
}
