package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Delivery;

public interface DeliveryService {
	
	void addDeliveryRequest(Delivery delivery);
	List<Delivery> getDelReqList(Delivery delivery);
	List<Delivery> getDelReadyList(Delivery delivery);
	//void modifyDelieveryState(int delivery);
	void modifyDeliveryReq(int deliverySeq);
	void modifyDeliveryReady(int deliverySeq);
	
	
	
}
