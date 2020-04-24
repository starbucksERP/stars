package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Purchase;

public interface PurchaseDAO {
	int insertPurchaseRequest (Purchase purchase); // 근형
	List<Purchase> displayPurchaseList(Purchase purchase); // 근형
	List<Purchase> displayFutureList(Purchase purchase); // 근형
	List<Purchase> displayPurchaseReq(Purchase purchase); // 근형
	List<Purchase> displayInProcess(Purchase purchase); // 근형
	int updatePurchaseState (int purchaseSeq); // 근형
}
