package site.bucks.dao;

import java.util.List;

import site.bucks.dto.ItemHistory;
import site.bucks.dto.Purchase;

public interface ItemHistoryDAO {
	
	int newPOItemHist(Purchase purchase);
	int updatedPOItemHist(int purchaseSeq);
	List<ItemHistory> selectItemHistoryist(ItemHistory history);
	int insertItemHistory(ItemHistory history);
}
