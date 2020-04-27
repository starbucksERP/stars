package site.bucks.service;

import site.bucks.dto.Purchase;

public interface ItemHistoryService {
	
	void newPOItemHist(Purchase purchase);
	void updatedPOItemHist(int purchaseSeq);
	
}
