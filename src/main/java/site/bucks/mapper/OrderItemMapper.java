package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface OrderItemMapper {
	int orderReceiptProcess(StoreItemHistory sih);
	int insertOrderItemByStore(StoreItemHistory sih);
	List<OrderItem> selectOrderItemByStore(StoreItemHistory sih);
	int updateOrderItemByStore(OrderItem orderItem);
}
