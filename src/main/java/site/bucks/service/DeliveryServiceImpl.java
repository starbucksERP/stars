package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dto.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{
	
	@Autowired
	private DeliveryDAO deliveryDAO;

	@Override
	public void addDeliveryRequest(Delivery delivery) {
		deliveryDAO.insertDeliveryRequest(delivery);
		
	}

	@Override
	public List<Delivery> getSearchDelReqList(Delivery delivery) {
		return deliveryDAO.searchDelReqList(delivery);
	}
	@Override
	public List<Delivery> getSearchDelReadyList(Delivery delivery) {
		return deliveryDAO.searchDelReadyList(delivery);
	}
	
	@Override
	public void modifyDeliveryReq(int deliverySeq) {
		deliveryDAO.updateDeliveryReq(deliverySeq);
		
	}

	@Override
	public void modifyDeliveryReady(int deliverySeq) {
		deliveryDAO.updateDeliveryReady(deliverySeq);
		
	}

	@Override
	public List<Delivery> getDisplayDelReqList(Delivery delivery) {
		return deliveryDAO.displayDelReqList(delivery);
	}

	@Override
	public List<Delivery> getDisplayDelReadyList(Delivery delivery) {
		return deliveryDAO.displayDelReadyList(delivery); 
	}

	@Override
	public void updateQtyFromDelivery(int deliverySeq) {
		 deliveryDAO.updateQtyFromDelivery(deliverySeq);
		
	}

	@Override
	public void insertDelReqConfimIH(int deliverySeq) {
		deliveryDAO.insertDelReqConfimIH(deliverySeq);
		
	}

	@Override
	public void insertDelReadyIH(int deliverySeq) {
		deliveryDAO.insertDelReadyIH(deliverySeq);
		
	}

	@Override
	public void insertSihFromDelInProcess(int deliverySeq) {
		deliveryDAO.insertSihFromDelInProcess(deliverySeq);
		
	}

	

}
