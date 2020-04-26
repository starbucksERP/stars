package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Purchase;

public interface PurchaseService {
	
	void addPurchaseRequest(Purchase purchase);
	List<Purchase> getSearchPurchaseList(Purchase purchase);
	void purchaseReqConfirm(int purchaseSeq);
	void purchaseComplete(int purchaseSeq);
	void purchaseCancel(int purchaseSeq);
	
	
}
