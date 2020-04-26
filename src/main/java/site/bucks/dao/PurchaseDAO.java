package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Purchase;

public interface PurchaseDAO {
	int insertPurchaseRequest (Purchase purchase); // 근형
	List<Purchase> searchPurchaseList(Purchase purchase); // 근형
	int purchaseReqConfirm(int purchaseSeq);
	int purchaseComplete(int purchaseSeq);
	int purchaseCancel(int purchaseSeq);
	
}
