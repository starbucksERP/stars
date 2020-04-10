package site.bucks.dto;

/*
 	지점 테이블 DTO
 
  이름            널?       유형            
------------- -------- ------------- 
STORE_CODE    NOT NULL NUMBER        
STORE_NAME             VARCHAR2(50)  
STORE_ADDRESS          VARCHAR2(200) 
STORE_PHONE            VARCHAR2(100) 
STORE_State            NUMBER  		0: 본사   1: 지점   9: 폐점
STORE_DATE             DATE    

 */
public class Store {
	private int storeCode;
	private String storeName;
	private String storeAddress;
	private String storePhone;
	private String storeState;
	private String storeDate;
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public int getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
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

	public String getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}
	
//	테스트용으로 제작
	@Override
	public String toString() {
		return storeCode+", "+storeName+", "+storeAddress+", "+storePhone+", "+storeState+", "+storeDate;
	}
	
}
