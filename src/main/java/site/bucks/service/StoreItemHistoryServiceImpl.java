package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.ItemDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;
import site.bucks.dto.OrderNum;

@Service
public class StoreItemHistoryServiceImpl implements StoreItemHistoryService{
	@Autowired
	private OrderItemDAO orderItemDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private StoreItemDAO storeItemDAO;
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private StoreItemHistoryDAO storeItemHistoryDAO;
	
//	숫자 출력
	@Override
	public List<OrderNum> getNumNum() {
		return storeItemHistoryDAO.numQty();
	}
	
	@Override
	public void modifyNumNum() {
		storeItemHistoryDAO.numQtyInit(); 
	}
	
	
//	발주 등록	(매개변수 배열로 받아서 처리 -  테스트 성공)
	@Override
	public void addRecipt(OrderItem orderItem) {
//		발주상태 발주요청 10으로 
		orderItem.setRequestState(10);
		
		orderItemDAO.insertStoreOrder(orderItem);
		storeItemHistoryDAO.insertSIH(orderItem);
		
		storeItemHistoryDAO.numQtyPlus(orderItem);
	}
	
	@Override
	public Map<String, Object> getStoreOrderView(String requestNum) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("orderItem", orderItemDAO.selectOrderItems(requestNum));
		return map;
	} 
	
	
	
//	발주 취소
	@Override
	public void modifyCancelRecipt(List<OrderItem> orderItemList) {
		for(OrderItem orderItem:orderItemList) {
			if(orderItem.getRequestState()!=10) {
				throw new RuntimeException("이미 발주가 접수되었습니다.");
			}else {
				orderItem.setRequestState(99);
				
//			주문 상태 변경
				//orderItemDAO.updateOrderItemState(numAndStateMap)(orderItem);
//			지점 history 상태 변경
				storeItemHistoryDAO.updateCancelStoreOrder(orderItem);
			}
		}
		
	}
	
	
//	지점에 물품 입하시 일어나는 메소드
	@Override
	public void modifyReceiptProcess(List<OrderItem> orderItemList) {
		for(OrderItem orderItem:orderItemList) {
			
//				order 에 아이템 이름이 없으므로 검색하여 저장후 sql실행
				String itemName=itemDAO.selectItem(orderItem.getItemNum()).getItemName();
				orderItem.setItemName(itemName);
				
//				발주상태 발주요청 70으로
				orderItem.setRequestState(70);
				
//				지점발주상태바꿔서 삽입
				storeItemHistoryDAO.insertSIH(orderItem);
//				배송상태변경
				deliveryDAO.updateDeliveryReceiptProcess(orderItem);
//				주문상태변경
				//orderItemDAO.updateOrderItem(orderItem);
//				지점재고수량변경
				storeItemDAO.updateStoreItemReceiptProcess(orderItem);
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

	@Override
	public List<OrderItem> getReciptSta(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return null;
	}


	
	





	






}
