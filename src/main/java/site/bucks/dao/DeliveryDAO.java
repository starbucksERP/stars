package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Delivery;
import site.bucks.dto.OrderItem;

public interface DeliveryDAO {	
	int updateDeliveryReceiptProcess(OrderItem orderItem);
	
	
	int insertDeliveryRequest(Delivery delivery); // 근형 
	List<Delivery> searchDelReqList(Delivery delivery); // 근형
	List<Delivery> displayDelReqList(Delivery delivery); // 근형
	List<Delivery> searchDelReadyList(Delivery delivery); // 근형
	List<Delivery> displayDelReadyList(Delivery delivery); // 근형
	//int updateDeliveryState(int deliverySeq); // 근형
	int updateDeliveryReq(int deliverySeq);
	int updateDeliveryReady(int deliverySeq);
}
