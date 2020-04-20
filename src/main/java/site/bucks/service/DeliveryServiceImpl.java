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
	public int addDeliveryRequest(Delivery delivery) {
		return deliveryDAO.insertDeliveryRequest(delivery);
		
	}

	@Override
	public List<Delivery> getDeliveryList(Delivery delivery) {
		return deliveryDAO.selectDeliveryList(delivery);
	}

	@Override
	public int modifyDelieveryState(int deliverySeq) {
		return deliveryDAO.updateDeliveryState(deliverySeq);
	}

	

}
