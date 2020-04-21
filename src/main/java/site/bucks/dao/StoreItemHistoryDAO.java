package site.bucks.dao;


import site.bucks.dto.OrderItem;

public interface StoreItemHistoryDAO {
	int insertSIH(OrderItem orderItem);
}
