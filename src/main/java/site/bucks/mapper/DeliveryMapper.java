package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Delivery;
import site.bucks.dto.OrderItem;

public interface DeliveryMapper {
	int updateDeliveryReceiptProcess(OrderItem orderItem);
	
	
	int insertDeliveryRequest(Delivery delivery); // 洹쇳�� 
	List<Delivery> selectDeliveryList(Delivery delivery); // 洹쇳��
	int updateDeliveryState(String requestNum); // 洹쇳��
}
