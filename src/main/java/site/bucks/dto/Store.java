package site.bucks.dto;

/*
 	���� ���̺� DTO
 
  �̸�            ��?       ����            
------------- -------- ------------- 
STORE_ID      NOT NULL NUMBER        					primary key
STORE_NAME    NOT NULL VARCHAR2(50)  
STORE_ADDRESS NOT NULL VARCHAR2(200) 
STORE_OWNER   NOT NULL VARCHAR2(50)  
STORE_PHONE   NOT NULL VARCHAR2(100) 
STORE_STATE   NOT NULL NUMBER        				0 : ����  / 1 : ����  /  9: ����
STORE_OPEN    NOT NULL DATE    

 */
public class Store {
	private int storeId;
	private String storeName;
	private String storeAddress;
	private String storeOwner;
	private String storePhone;
	private String storeState;
	private String storeOpen;
	
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



	public String getStoreState() {
		return storeState;
	}


	public void setStoreState(String storeState) {
		this.storeState = storeState;
	}


	public String getstoreOpen() {
		return storeOpen;
	}


	public void setstoreOpen(String storeOpen) {
		this.storeOpen = storeOpen;
	}


	//	�׽�Ʈ������ ����
	@Override
	public String toString() {
		return storeId+", "+storeName+", "+storeAddress+", "+storeOwner+", "+storePhone+", "+storeState+", "+storeOpen;
	}

	
}
