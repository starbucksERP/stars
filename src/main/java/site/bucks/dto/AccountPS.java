package site.bucks.dto;


// �������԰� ������� �������� ���
//  => ���������丮���̺�� �ֹ����̺� 
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
