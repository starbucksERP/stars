package site.bucks.service;

import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryService {   
	List<OrderItem> getReciptSta(OrderItem orderItem);
	void addRecipt(OrderItem orderItem);
	void modifyCancelRecipt(List<OrderItem> orderItem);
	void modifyReceiptProcess(OrderItem orderItem); 
}
