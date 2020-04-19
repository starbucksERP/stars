package site.bucks.service;

import java.util.List;

import site.bucks.dto.Delivery;

public interface DeliveryService {
	
	void addDeliveryRequest(Delivery delivery);
	List<Delivery> getDeliveryList(Delivery delivery);
	void modifyDelieveryState(List<Delivery> delivery);
	
	
}
