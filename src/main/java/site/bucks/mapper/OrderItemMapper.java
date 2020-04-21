package site.bucks.mapper;


import java.util.List;

import site.bucks.dto.OrderItem;

public interface OrderItemMapper {
	int insertStoreOrder(OrderItem orderItem);
	List<OrderItem> selectStoreOrderItemList(OrderItem orderItem);
	int updateOrderReceiptProcess(OrderItem orderItem); 

	// 媛�����
	int updateOrderItem(OrderItem orderItem);
	List<OrderItem> selectOrderItemList(OrderItem orerItem);
	int selectOrderItemQty(String requestNum);
	OrderItem selectOrderItem(int orderSeq);
	
}
