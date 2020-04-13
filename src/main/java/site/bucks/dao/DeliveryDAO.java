package site.bucks.dao;

import site.bucks.dto.StoreItemHistory;

public interface DeliveryDAO {
	int deliveryReceiptProcess(StoreItemHistory sih);
		
}
