package site.bucks.dto;

/*�̸� 000            ��?       ����     
-------------- -------- ------ 
DELIVERY_SEQ   NOT NULL NUMBER 
REQUEST_NUM    NOT NULL VARCHAR2(20)
STORE_ID       NOT NULL NUMBER 
DELIVERY_STATE NOT NULL NUMBER 
DELIVERY_START NOT NULL DATE   
DELIVERY_END            DATE  */
public class Delivery {
	private int deliverySeq;
	private String requestNum;
	private int storeId;
	private int deliveryState;
	private String deliveryStart;
	private String deliveryStartTwo;
	private String deliveryEnd;
	private String deliveryEndTwo;
	private int nowDeliveryState; //배송요청조회 페이지(40), 배송현황조회 페이지(50)으로 동적SQL에 적용하기 위함

	public Delivery() {
		// TODO Auto-generated constructor stub
	}

	public int getDeliverySeq() {
		return deliverySeq;
	}

	public void setDeliverySeq(int deliverySeq) {
		this.deliverySeq = deliverySeq;
	}

	public String getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(String requestNum) {
		this.requestNum = requestNum;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getDeliveryState() {
		return deliveryState;
	}

	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
	}

	public String getDeliveryStart() {
		return deliveryStart;
	}

	public void setDeliveryStart(String deliveryStart) {
		this.deliveryStart = deliveryStart;
	}

	public String getDeliveryEnd() {
		return deliveryEnd;
	}

	public void setDeliveryEnd(String deliveryEnd) {
		this.deliveryEnd = deliveryEnd;
	}

	public int getNowDeliveryState() {
		return nowDeliveryState;
	}

	public void setNowDeliveryState(int nowDeliveryState) {
		this.nowDeliveryState = nowDeliveryState;
	}

	public String getDeliveryStartTwo() {
		return deliveryStartTwo;
	}

	public void setDeliveryStartTwo(String deliveryStartTwo) {
		this.deliveryStartTwo = deliveryStartTwo;
	}

	public String getDeliveryEndTwo() {
		return deliveryEndTwo;
	}

	public void setDeliveryEndTwo(String deliveryEndTwo) {
		this.deliveryEndTwo = deliveryEndTwo;
	}
	
	
	
}
