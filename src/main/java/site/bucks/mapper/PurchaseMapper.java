package site.bucks.mapper;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;
import site.bucks.dto.Purchase;

public interface PurchaseMapper {
	int insertPurchaseOrder (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm (String requestNum); // 근형
	int purchaseComplete (String requestNum); // 근형
	int purchaseCompleteHQ (String requestNum); // 근형
	int purchaseCancel (String requestNum); // 근형
	int updateQtyFromPurchase(int purchaseSeq);
	int insertDeliveryFromPurchase(String requestNum);
	// 자동주문관련
	List<Purchase> selectPurchseByPlan(String today); 
	int insertAutoPurchase(Item item);
	
}
