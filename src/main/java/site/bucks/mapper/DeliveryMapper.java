package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Delivery;
import site.bucks.dto.OrderItem;

public interface DeliveryMapper {
	int updateDeliveryReceiptProcess(OrderItem orderItem);
	
	
	int insertDeliveryRequest(Delivery delivery); // 근형 
	List<Delivery> searchDelReqList(Delivery delivery); // 근형
	List<Delivery> searchDelReadyList(Delivery delivery); // 근형
	List<Delivery> displayDelReadyList(Delivery delivery); // 근형
	List<Delivery> displayDelReqList(Delivery delivery); // 근형
	//int updateDeliveryState(int deliverySeq); // 근형
	int updateDeliveryReq(int deliverySeq);
	int updateDeliveryReady(int deliverySeq);
	int updateQtyFromDelivery(int deliverySeq);
	int insertDelReqConfimIH(int deliverySeq); // 배송 요청확인 처리에서 히스토리 insert 
	int insertDelReadyIH(int deliverySeq); // 배송 시작 승인 처리에서 히스토리 insert 
	int insertSihFromDelInProcess(int deliverySeq);
	
	
	
}
