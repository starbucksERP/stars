package site.bucks.service;

import java.util.List;

import site.bucks.dto.Delivery;

public interface DeliveryService {
	
	int addDeliveryRequest(Delivery delivery);
	List<Delivery> getDeliveryList(Delivery delivery);
	int modifyDelieveryState(int deliverySeq);
	
	
}
