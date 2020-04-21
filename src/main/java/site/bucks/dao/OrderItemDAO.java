package site.bucks.dao;



import java.util.List;

import site.bucks.dto.OrderItem;

public interface OrderItemDAO {
	int insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItemList(OrderItem orderItem);
	int updateOrderReceiptProcess(OrderItem orderItem);
}
