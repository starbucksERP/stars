package site.bucks.dto;


public class Account {

//	지점매입 + 본사매출 공통 필드명

	private StoreItemHistory sih;
	
	private OrderItem oi;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public StoreItemHistory getSih() {
		return sih;
	}

	public void setSih(StoreItemHistory sih) {
		this.sih = sih;
	}

	public OrderItem getOi() {
		return oi;
	}

	public void setOi(OrderItem oi) {
		this.oi = oi;
	}
	
	


	
	
	
}
