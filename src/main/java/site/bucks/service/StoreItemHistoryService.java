package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;

public interface StoreItemHistoryService {   
	List<OrderItem> getReciptSta(OrderItem orderItem);
	void addRecipt(OrderItem orderItem);
	void modifyCancelRecipt(List<OrderItem> orderItem);
	void modifyReceiptProcess(OrderItem orderItem); 
	
	Map<String, Object> getItem(Item item);
	Map<String, Object> getItemName(String itemName);
}
