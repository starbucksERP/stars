package site.bucks.mapper;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;
import site.bucks.dto.Purchase;

public interface PurchaseMapper {
	int insertPurchaseOrder (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm (int purchaseSeq); // 근형
	int purchaseComplete (int purchaseSeq); // 근형
	int purchaseCompleteHQ (int purchaseSeq); // 근형
	int purchaseCancel (int purchaseSeq); // 근형
	int updateQtyFromPurchase(int purchaseSeq);
	String insertDeliveryFromPurchase(String requestNum);
	// 자동주문관련
	List<Purchase> selectPurchseByPlan(String today); 
	int insertAutoPurchase(Item item);
	
}
