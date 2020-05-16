package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.OrderItem;

public interface OrderItemService {
	List<OrderItem> getStoreOrderItems(String requestNum, String storeId);

	// 본점용
	void modifyOrderItemState(Map<String, Object> numAndStateMap);
	List<OrderItem> getOrderItemList(OrderItem orderItem);
	List<OrderItem> getOrderItems(String requestNum);
	void modifyOrderStateByCheckQty(String requestNum, String user);
	void addHistory(String reqNum, int state, String user);
	void addOrderByMinQty(String today, String user);
	

	// 근형
	void updateOrderStateFromPurchase(String requestNum);
	void updateOrderStateFromDelivery(int deliverySeq);
	

}
