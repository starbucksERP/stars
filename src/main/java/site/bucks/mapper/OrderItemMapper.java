package site.bucks.mapper;


import java.util.List;
import java.util.Map;

import site.bucks.dto.OrderItem;

public interface OrderItemMapper {
	int insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItems(String requestNum, String storeId);
	int updateOrderCheck(OrderItem orderItem);

	// 본점용
	int updateOrderItemState(Map<String, Object> numAndStateMap);
	List<OrderItem> selectOrderItemList(OrderItem orerItem);
	List<OrderItem> selectOrderItems(String requestNum);
	
	// 근형
	int updateOrderStateFromPurchase (String requestNum);
	int updateOrderStateFromDelivery (int deliverySeq);
}
