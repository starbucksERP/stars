package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;
import site.bucks.dto.Purchase;

public interface PurchaseDAO {
	int insertPurchaseOrder (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm(int purchaseSeq);
	int purchaseComplete(int purchaseSeq);
	int purchaseCompleteHQ(int purchaseSeq);
	int purchaseCancel(int purchaseSeq);
	int updateQtyFromPurchase(int purchaseSeq);
	String insertDeliveryFromPurchase(String requestNum);
	List<Purchase> selectPurchseByPlan(String today);  // 자동주문관련
	int insertAutoPurchase(Item item);
}
