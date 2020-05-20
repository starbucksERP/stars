package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Item;
import site.bucks.dto.Purchase;

public interface PurchaseDAO {
	int insertPurchaseOrder (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm(String requestNum);
	int purchaseComplete(String requestNum);
	int purchaseCompleteHQ(String requestNum);
	int purchaseCancel(String requestNum);
	int updateQtyFromPurchase(int purchaseSeq);
	List<Purchase> selectPurchseByPlan(String today);  // 자동주문관련
	int insertAutoPurchase(Item item);
	int insertDeliveryFromPurchase(String requestNum);
}
