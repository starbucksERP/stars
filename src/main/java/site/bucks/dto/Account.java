package site.bucks.dto;


public class Account {

//	지점매입 + 본사매출 공통 필드명

	private StoreItemHistory sih;
	
	private OrderItem oi;
	
	private Store st;
	
	
//	본사매입
	private ItemHistory ih;
	
	private Item i;
	
	private Purchase p;
	
//	지점매출
	private Sale s;
	
	
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

	public Store getSt() {
		return st;
	}

	public void setSt(Store st) {
		this.st = st;
	}

	public ItemHistory getIh() {
		return ih;
	}

	public void setIh(ItemHistory ih) {
		this.ih = ih;
	}


	public Item getI() {
		return i;
	}

	public void setI(Item i) {
		this.i = i;
	}

	public Purchase getP() {
		return p;
	}

	public void setP(Purchase p) {
		this.p = p;
	}

	public Sale getS() {
		return s;
	}

	public void setS(Sale s) {
		this.s = s;
	}

	

	
	
	
}
