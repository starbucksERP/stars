package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dto.Delivery;

@Service
public class DelieveryServiceImpl implements DeliveryService{
	
	@Autowired
	private DeliveryDAO deliveryDAO;

	@Override
	public void addDeliveryRequest(Delivery delivery) {
		deliveryDAO.insertDeliveryRequest(delivery);
		
	}

	@Override
	public List<Delivery> getDeliveryList(Delivery delivery) {
		return deliveryDAO.selectDeliveryList(delivery);
	}

	@Override
	public void modifyDelieveryState(List<Delivery> delivery) {
		
		if(delivery.isEmpty()) {
			throw new RuntimeException("선택된 배송일정이 없습니다.");
		}
		
	}

}
