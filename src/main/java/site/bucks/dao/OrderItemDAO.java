package site.bucks.dao;



import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface OrderItemDAO {
	int insertStoreOrder(OrderItem orderItem);
	int updateOrderItemByStore(StoreItemHistory sih);
	int updateOrderReceiptProcess(StoreItemHistory sih);
}
