package site.bucks.service;

import java.util.List;

import site.bucks.dto.ItemHistory;
import site.bucks.dto.Purchase;

public interface ItemHistoryService {

	void newPOItemHist(Purchase purchase);
	void updatedPOItemHist(String requestNum);
	List<ItemHistory> getItemHistoryist(ItemHistory history);
	void addItemHistory(ItemHistory history);
	

}
