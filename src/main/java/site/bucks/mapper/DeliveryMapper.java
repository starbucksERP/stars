package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Delivery;
import site.bucks.dto.StoreItemHistory;

public interface DeliveryMapper {
	int updateDeliveryReceiptProcess(StoreItemHistory sih);
	
	
	int insertDeliveryRequest(Delivery delivery); // 근형 
	List<Delivery> selectDeliveryList(Delivery delivery); // 근형
	int updateDeliveryState(int deliverySeq); // 근형
}
