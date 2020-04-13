package site.bucks.dao;

import site.bucks.dto.StoreItemHistory;

public interface OrderItemDAO {
	int orderReceiptProcess(StoreItemHistory sih);
}
