package site.bucks.service;

import java.util.List;

import site.bucks.dto.OrderItem;

public interface OrderItemService {
	void insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItemList(OrderItem orderItem);
	void updateOrderReceiptProcess(OrderItem orderItem);

	// 본점용
	void updateOrderItem(OrderItem orderItem);
	List<OrderItem> selectOrderItemList(OrderItem orerItem);
	List<OrderItem> selectOrderItems(String requestNum);
	void checkQty(String requestNum);

}
