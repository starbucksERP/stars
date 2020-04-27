package site.bucks.dao;

import site.bucks.dto.Purchase;

public interface ItemHistoryDAO {
	
	int newPOItemHist(Purchase purchase);
	int updatedPOItemHist(int purchaseSeq);
}
