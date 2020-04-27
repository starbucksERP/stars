package site.bucks.service;

import java.util.List;

import site.bucks.dto.Delivery;

public interface DeliveryService {
	
	void addDeliveryRequest(Delivery delivery);
	List<Delivery> getSearchDelReqList(Delivery delivery);
	List<Delivery> getDisplayDelReqList(Delivery delivery);
	List<Delivery> getSearchDelReadyList(Delivery delivery);
	List<Delivery> getDisplayDelReadyList(Delivery delivery);
	//void modifyDelieveryState(int delivery);
	void modifyDeliveryReq(int deliverySeq);
	void modifyDeliveryReady(int deliverySeq);
	void updateQtyFromDelivery(int deliverySeq);
	void insertDelReqConfimIH(int deliverySeq); 
	void insertDelReadyIH(int deliverySeq);
	void insertSihFromDelInProcess(int deliverySeq);
	
}
