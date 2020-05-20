package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Purchase;

public interface PurchaseService {
	
	void insertPurchaseOrder(Purchase purchase);
	List<Purchase> getSearchPurchaseList(Purchase purchase);
	void purchaseReqConfirm(String requestNum);
	void purchaseComplete(String requestNum);
	void purchaseCompleteHQ(String requestNum);
	void purchaseCancel(String requestNum);
	void updateQtyFromPurchase(int purchaseSeq);
	void insertDeliveryFromPurchase(String requestNum);
	List<Purchase> getPurchseByPlan(String today);
}
