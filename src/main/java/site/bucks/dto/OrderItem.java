package site.bucks.dto;
/*이름            널?       유형           
------------- -------- ------------ 
ORDER_SEQ     NOT NULL NUMBER       
REQUEST_NUM   NOT NULL VARCHAR2(20) 
STORE_ID      NOT NULL NUMBER       
ITEM_NUM      NOT NULL VARCHAR2(50) 
ORDER_QTY     NOT NULL NUMBER       
ITEM_PPRICE   NOT NULL NUMBER       
ITEM_SPRICE   NOT NULL NUMBER       
REQUEST_STATE NOT NULL NUMBER       
REQUEST_DATE  NOT NULL DATE         
DELIVERY_DATE          DATE         
ORDER_TYPE    NOT NULL NUMBER    */   
public class OrderItem {
	private int orderSeq;
	private String requestNum;
	private int storeId;
	private String itemNum;
	private int orderQty;
	private int itemPprice;
	private int itemSprice;
	private int requestState;
	private String requestDate;
	private String deliveryDate;
	private int orderType;
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
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

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public int getItemPprice() {
		return itemPprice;
	}

	public void setItemPprice(int itemPprice) {
		this.itemPprice = itemPprice;
	}

	public int getItemSprice() {
		return itemSprice;
	}

	public void setItemSprice(int itemSprice) {
		this.itemSprice = itemSprice;
	}

	public int getRequestState() {
		return requestState;
	}

	public void setRequestState(int requestState) {
		this.requestState = requestState;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	
}
