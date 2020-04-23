package site.bucks.dto;


// 지점매입과 본사매출 공통으로 사용
//  => 지점히스토리테이블과 주문테이블 
public class AccountPS {

	private StoreItemHistory sih;
	private OrderItem orderItem;
	
	public AccountPS() {
		// TODO Auto-generated constructor stub
	}

	public StoreItemHistory getSih() {
		return sih;
	}

	public void setSih(StoreItemHistory sih) {
		this.sih = sih;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	
	
	
}
