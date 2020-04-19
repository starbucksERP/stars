package site.bucks.dao;



import java.util.List;

import site.bucks.dto.OrderItem;

public interface OrderItemDAO {
	int insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItemList(OrderItem orderItem);
	int updateOrderReceiptProcess(OrderItem orderItem);

	// 본점용
	int updateOrderItem(OrderItem orderItem);
	List<OrderItem> selectOrderItemList(OrderItem orerItem);
	List<OrderItem> selectOrderItems(String requestNum);
}
