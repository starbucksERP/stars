package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.OrderItem;

public interface OrderItemService {
	void insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItemList(OrderItem orderItem);
	void updateOrderReceiptProcess(OrderItem orderItem);

	// 본점용
	void modifyOrderItemState(Map<String, Object> numAndStateMap);
	List<OrderItem> getOrderItemList(OrderItem orderItem);
	List<OrderItem> getOrderItems(String requestNum);
	void checkQty(String requestNum);

}
