package site.bucks.mapper;


import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface OrderItemMapper {
	int insertStoreOrder(OrderItem orderItem);
	int updateOrderItemByStore(StoreItemHistory sih);
	int updateOrderReceiptProcess(StoreItemHistory sih); 
}
