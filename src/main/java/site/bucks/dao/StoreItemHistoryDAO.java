package site.bucks.dao;


import java.util.List;

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;

public interface StoreItemHistoryDAO {
	int insertSIH(OrderItem orderItem);
	List<String> searchItems(Item item);
	Item searchItem(String itemName);
}
