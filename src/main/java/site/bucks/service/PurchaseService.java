package site.bucks.service;

import java.util.List;

import site.bucks.dto.Purchase;

public interface PurchaseService {
	
	void addPurchaseRequest(Purchase purchase);
	List<Purchase> getDisplayPurchaseList(Purchase purchase);
	void modifyPurchaseState(List<Purchase> purchase);
}
