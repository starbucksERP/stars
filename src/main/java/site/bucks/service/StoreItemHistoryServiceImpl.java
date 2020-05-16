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
import site.bucks.dto.OrderItem;
import site.bucks.dto.OrderNum;
import site.bucks.dto.StoreItem;

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
	public void modifyCancelRecipt(OrderItem orderItem){
			if(orderItem.getRequestState()!=10) {
				throw new RuntimeException("이미 발주가 접수되었습니다.");
			}else {
				orderItem.setRequestState(99);
				
//			주문 상태 변경
			orderItemDAO.updateOrderCheck(orderItem);
//			지점 history 상태 변경
			storeItemHistoryDAO.updateCancelStoreOrder(orderItem);
		}
		
	}
	
	
//	지점에 물품 입하시 일어나는 메소드(배송중 상태가 아닌걸 바꾸려면 exception)
	@Override
	public void modifyReceiptProcess(List<OrderItem> orderItemList) {
		for(OrderItem orderItem:orderItemList) {
//				배송중인것만 시행
				System.out.println(orderItem.getRequestState());
				if(orderItem.getRequestState()==60) {
	//				발주상태 입고완료 70으로
					orderItem.setRequestState(70);
					
	//				지점발주상태바꿔서 삽입
					storeItemHistoryDAO.insertSIH(orderItem);
	//				배송상태변경(메소드 그냥 사용하려고 만들)
					deliveryDAO.updateDeliveryReceiptProcess(orderItem);
	//				주문상태변경
					orderItemDAO.updateOrderCheck(orderItem);
					
	//				지점재고수량변경
	//				변경전 재고에 있는지 여부 판단
					StoreItem si = storeItemDAO.selectExistStoreItem(orderItem);
				if(si==null) {
//					재고 없므면 재고 삽입
					storeItemDAO.insertStoreItemReceiptProcess(orderItem);
				}else {
//					재고 있으면 기본 재고에 재고량 증가
					storeItemDAO.updateStoreItemReceiptProcess(orderItem);
				}
				
			}else {
				throw new RuntimeException("아직 본사에서 배송이 시작되지 않았습니다.");
			}
		}
	}


	/*
	 * // 아이템이름 검색
	 * 
	 * @Override public Map<String, Object> getItem(Item item) { Map<String, Object>
	 * map= new HashMap<String, Object>(); map.put("items",
	 * storeItemHistoryDAO.searchItems(item)); return map; }
	 * 
	 * // 아이템 정보검색
	 * 
	 * @Override public Map<String, Object> getItemName(String itemName) {
	 * Map<String, Object> map= new HashMap<String, Object>(); map.put("item",
	 * storeItemHistoryDAO.searchItem(itemName)); return map; }
	 */

	@Override
	public List<OrderItem> getReciptSta(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return null;
	}



	
	





	






}
