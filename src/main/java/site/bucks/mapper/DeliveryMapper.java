package site.bucks.mapper;

import site.bucks.dto.StoreItemHistory;

public interface DeliveryMapper {
	int deliveryReceiptProcess(StoreItemHistory sih);
}
