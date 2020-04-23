package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Delivery> getDelReqList(Delivery delivery) {
		return deliveryDAO.selectDelReqList(delivery);
	}
	@Override
	public List<Delivery> getDelReadyList(Delivery delivery) {
		return deliveryDAO.selectDelReadyList(delivery);
	}

	/*
	 * @Override public void modifyDelieveryState(int deliverySeq) {
	 * deliveryDAO.updateDeliveryState(deliverySeq); }
	 */

	@Override
	public void modifyDeliveryReq(int deliverySeq) {
		deliveryDAO.updateDeliveryReq(deliverySeq);
		
	}

	@Override
	public void modifyDeliveryReady(int deliverySeq) {
		deliveryDAO.updateDeliveryReady(deliverySeq);
		
	}

	

}
