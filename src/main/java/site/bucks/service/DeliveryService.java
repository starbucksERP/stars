package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Delivery;

public interface DeliveryService {
	
	void addDeliveryRequest(Delivery delivery);
	List<Delivery> getDeliveryList(Delivery delivery);
	//void modifyDelieveryState(int delivery);
	void modifyDeliveryReq(int deliverySeq);
	void modifyDeliveryReady(int deliverySeq);
	
	
	
}
