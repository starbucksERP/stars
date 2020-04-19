package site.bucks.mapper;


import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface OrderItemMapper {
	int insertStoreOrder(OrderItem orderItem);
	int updateOrderItemByStore(StoreItemHistory sih);
	int updateOrderReceiptProcess(StoreItemHistory sih); 

	// 가을이
	int updateOrderItem(OrderItem orderItem);
	List<OrderItem> selectOrderItemList(OrderItem orerItem);
	int selectOrderItemQty(String requestNum);
	OrderItem selectOrderItem(int orderSeq);
	
}
