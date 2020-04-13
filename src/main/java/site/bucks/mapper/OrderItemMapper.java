package site.bucks.mapper;

import site.bucks.dto.StoreItemHistory;

public interface OrderItemMapper {
	int orderReceiptProcess(StoreItemHistory sih);
}
