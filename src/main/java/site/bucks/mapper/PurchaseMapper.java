package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Purchase;

public interface PurchaseMapper {
	int insertPurchaseRequest (Purchase purchase); // 근형
	List<Purchase> selectPurchaseList(Purchase purchase); // 근형
	int updatePurchaseState (int purchaseSeq); // 근형
	
}
