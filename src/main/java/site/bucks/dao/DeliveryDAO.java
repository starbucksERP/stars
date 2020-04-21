package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Delivery;
import site.bucks.dto.OrderItem;

public interface DeliveryDAO {	
	int updateDeliveryReceiptProcess(OrderItem orderItem);
	
	
	int insertDeliveryRequest(Delivery delivery); // 근형 
	List<Delivery> selectDeliveryList(Delivery delivery); // 근형
	int updateDeliveryState(int deliverySeq); // 근형
}
