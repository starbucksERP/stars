package site.bucks.dto;

/*이름            널?       유형     
------------- -------- ------ 
STORE_ID               NUMBER 
ORDER_NUM_QTY          NUMBER*/
public class OrderNum {
	private int storeId;
	private int orderNumQty;
	
	public OrderNum() {
		// TODO Auto-generated constructor stub
	}


	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getOrderNumQty() {
		return orderNumQty;
	}

	public void setOrderNumQty(int orderNumQty) {
		this.orderNumQty = orderNumQty;
	}
	

}
