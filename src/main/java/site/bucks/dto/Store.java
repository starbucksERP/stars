package site.bucks.dto;

import java.util.List;

/*
 		지점 테이블 DTO
 		
이름            널?       유형            
------------- -------- -------------  
STORE_ID      NOT NULL NUMBER                       primary key
STORE_NAME    NOT NULL VARCHAR2(50)  
STORE_ADDRESS NOT NULL VARCHAR2(200) 
STORE_OWNER   NOT NULL VARCHAR2(50)  
STORE_PHONE   NOT NULL VARCHAR2(100) 
STORE_STATE   NOT NULL NUMBER                       0: 본사  /  1: 지점  /  9: 폐점
STORE_OPEN    NOT NULL VARCHAR2(50)                 개업일 
STORE_CLOSE            VARCHAR2(50)                 폐업일

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
	
	private List<Integer> states;	// 체크박스 검색용
	
	
	
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

	//	테스트용으로 제작
	@Override
	public String toString() {
		return storeId+", "+storeName+", "+storeAddress+", "+storeOwner+", "+storePhone+", "+storeState+", "+storeOpen+", "+storeClose;
	}

	
}
