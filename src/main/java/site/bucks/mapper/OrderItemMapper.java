package site.bucks.mapper;


import site.bucks.dto.StoreItemHistory;

public interface OrderItemMapper {
	int insertOrderItemByStore(StoreItemHistory sih);
	int updateOrderItemByStore(StoreItemHistory sih);
	int updateOrderReceiptProcess(StoreItemHistory sih); 
}
