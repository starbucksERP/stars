package site.bucks.mapper;


import java.util.List;

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;

public interface StoreItemHistoryMapper {
	int insertSIH(OrderItem orderItem);
	List<String> searchItems(Item item);
	Item searchItem(String itemName);
}
