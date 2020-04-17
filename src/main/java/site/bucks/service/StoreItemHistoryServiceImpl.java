package site.bucks.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

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
	public List<StoreItemHistory> getReciptSta(AppliedOrderSta orderSta) {
		return storeItemHistoryDAO.selectReciptConditionList(orderSta);
	}
	
	
//	발주 등록	(매개변수 배열로 받아서 처리 -  테스트 성공)
	@Override
	public void addRecipt(OrderItem orderItem) {
		orderItemDAO.insertStoreOrder(orderItem);
		storeItemHistoryDAO.insertSIH(orderItem);
	}
	
	
	
//	발주 등록후 수정시[상태 10인 경우만] 메소드	(매개변수 배열로 받아서 처리 -  테스트 성공)
	@Override
	public void modifyRecipt(List<StoreItemHistory> sihList) {
		if(sihList.size()==0) {
			throw new RuntimeException("수정할 발주가 없습니다.");	
		}
		
		for(StoreItemHistory sih:sihList) {
			
//			SIH 는 기존 저장 정보 		sih는 신규 저장 정보
			StoreItemHistory SIH=storeItemHistoryDAO.selectState10(sih);
			
			if(SIH==null) {
				throw new RuntimeException("이미 발주가 접수되었습니다.");
			}
			
//			기존정보와 신규정보가 같다면 메소드 회귀
			if(SIH.getItemNum().equals(sih.getItemNum()) && SIH.getItemQty()==sih.getItemQty()) {
				continue;
			}else {
//				발주정보 변경하고
				storeItemHistoryDAO.updateStoreItemHistory(sih);
				
				orderItemDAO.updateOrderItemByStore(sih);
			}
		}
	}
	
	@Override
	public void modifyCancelRecipt(List<StoreItemHistory> sihList) {
		if(sihList.size()==0) {
			throw new RuntimeException("취소할 발주가 없습니다.");	
		}
		
		for(StoreItemHistory sih:sihList) {
			if(storeItemHistoryDAO.selectState10(sih).getItemState()!=10) {
				throw new RuntimeException("이미 발주가 접수되었습니다.");
			}else {
				storeItemHistoryDAO.updateCancelProcess(sih);
			}
		}
	}
	
	
//	지점에 물품 입하시 일어나는 메소드
	@Override
	public void modifyReceiptProcess(StoreItemHistory sih) {
//		지점발주상태변경
		storeItemHistoryDAO.updateReceiptProcess(sih);
//		배송상태변경
		deliveryDAO.updateDeliveryReceiptProcess(sih);
//		주문상태변경
		orderItemDAO.updateOrderReceiptProcess(sih);
//		지점재고수량변경
		storeItemDAO.updateStoreItemReceiptProcess(sih);
	}


	






}
