package site.bucks.dto;

/*이름             널?       유형     
-------------- -------- ------ 
DELIVERY_SEQ   NOT NULL NUMBER 
REQUEST_NUM    NOT NULL NUMBER 
STORE_ID       NOT NULL NUMBER 
DELIVERY_STATE NOT NULL NUMBER 
DELIVERY_START NOT NULL DATE   
DELIVERY_END            DATE  */
public class Delivery {
	private int deliverySeq;
	private int requestNum;
	private int storeId;
	private int deliverySate;
	private String deliveryStart;
	private String deliveryEnd;

	public Delivery() {
		// TODO Auto-generated constructor stub
	}

	public int getDeliverySeq() {
		return deliverySeq;
	}

	public void setDeliverySeq(int deliverySeq) {
		this.deliverySeq = deliverySeq;
	}

	public int getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(int requestNum) {
		this.requestNum = requestNum;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getDeliverySate() {
		return deliverySate;
	}

	public void setDeliverySate(int deliverySate) {
		this.deliverySate = deliverySate;
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
	
}
