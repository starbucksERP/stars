package site.bucks.dao;



import site.bucks.dto.StoreItemHistory;

public interface OrderItemDAO {
	int insertOrderItemByStore(StoreItemHistory sih);
	int updateOrderItemByStore(StoreItemHistory sih);
	int updateOrderReceiptProcess(StoreItemHistory sih);
}
