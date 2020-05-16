package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.OrderItem;
import site.bucks.dto.OrderNum;

public interface StoreItemHistoryService {   
	public List<OrderNum> getNumNum();
	public void modifyNumNum();
	
	
	List<OrderItem> getReciptSta(OrderItem orderItem);
	void addRecipt(OrderItem orderItem);
	Map<String, Object> getStoreOrderView(String requestNum);
	
	void modifyCancelRecipt(OrderItem orderItem);
	void modifyReceiptProcess(OrderItem orderItem) ;
//	Map<String, Object> getItem(Item item);
//	Map<String, Object> getItemName(String itemName);
}
