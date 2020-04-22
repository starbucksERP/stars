package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;

@Service
public class StoreItemHistoryServiceImpl implements StoreItemHistoryService{
	@Autowired
	private OrderItemDAO orderItemDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private StoreItemDAO storeItemDAO;
	@Autowired
	private StoreItemHistoryDAO storeItemHistoryDAO;
	
//	발주 현황 조회 리스트
	@Override
	public List<OrderItem> getReciptSta(OrderItem orderItem) {
		return orderItemDAO.selectStoreOrderItemList(orderItem);
	}
	
	
//	발주 등록	(매개변수 배열로 받아서 처리 -  테스트 성공)
	@Override
	public void addRecipt(OrderItem orderItem) {
//		발주상태 발주요청 10으로 
		orderItem.setRequestState(10);
		
		orderItemDAO.insertStoreOrder(orderItem);
		storeItemHistoryDAO.insertSIH(orderItem);
	}
	
	
	
	@Override
	public void modifyCancelRecipt(List<OrderItem> orderItemList) {
		for(OrderItem orderItem:orderItemList) {
			if(orderItem.getRequestState()!=10) {
				throw new RuntimeException("이미 발주가 접수되었습니다.");
			}else {
				orderItem.setRequestState(99);
				
//			주문 상태 변경
				orderItemDAO.updateOrderItem(orderItem);
//			지점 history 상태 변경
				storeItemHistoryDAO.updateCancelStoreOrder(orderItem);
			}
		}
		
	}
	
	
//	지점에 물품 입하시 일어나는 메소드
	@Override
	public void modifyReceiptProcess(List<OrderItem> orderItemList) {
		for(OrderItem orderItem:orderItemList) {
			if(orderItem.getRequestState()==60) {
//				발주상태 발주요청 70으로
				orderItem.setRequestState(70);
				
//				지점발주상태바꿔서 삽입
				storeItemHistoryDAO.insertSIH(orderItem);
//				배송상태변경
				deliveryDAO.updateDeliveryReceiptProcess(orderItem);
//				주문상태변경
				orderItemDAO.updateOrderItem(orderItem);
//				지점재고수량변경
				storeItemDAO.updateStoreItemReceiptProcess(orderItem);
			}else {
				throw new RuntimeException("아직 배송완료되지 않았습니다.");
			}
		}
	}


//	아이템이름 검색
	@Override
	public Map<String, Object> getItem(Item item) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("items", storeItemHistoryDAO.searchItems(item));
		return map;
	}

//	아이템 정보검색
	@Override
	public Map<String, Object> getItemName(String itemName) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("item", storeItemHistoryDAO.searchItem(itemName));
		return map;
	} 
	




	






}
