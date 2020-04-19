package site.bucks.dao;

import site.bucks.dto.StoreItemHistory;

public interface DeliveryDAO {	
	int updateDeliveryReceiptProcess(StoreItemHistory sih);
	
	// 이근형 - 내가 Delivery 매퍼에 만든 메소드 DAO랑 Impl에 구현해야함.
}
