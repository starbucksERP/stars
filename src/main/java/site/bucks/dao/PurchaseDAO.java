package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Purchase;

public interface PurchaseDAO {
	int insertPurchaseOrder (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm(String requestNum);
	int purchaseComplete(String requestNum);
	int purchaseCompleteHQ(String requestNum);
	int purchaseCancel(String requestNum);
	int updateQtyFromPurchase(int purchaseSeq);
	int insertDeliveryFromPurchase(String requestNum);
}
