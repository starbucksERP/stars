package site.bucks.dao;

import site.bucks.dto.Purchase;

public interface ItemHistoryDAO {
	
<<<<<<< HEAD
	int newPOItemHist(Purchase purchase);
	int updatedPOItemHist(int purchaseSeq);
=======
	int insertItemHistory (ItemHistory itemHistory); 
	List<ItemHistory> selectItemHistoryist(ItemHistory itemHistory);

	/*
	List<ItemHistory> recentHistoryList(); // 근형
	List<ItemHistory> selectItemHistoryList(ItemHistory itemHistory); // 근형
	List<ItemHistory> allHistoryTap(); // 근형
	List<ItemHistory> goodsReceivedHistoryTap(); // 근형
	List<ItemHistory> goodsShippedHistoryTap(); // 근형
	List<ItemHistory> requestConfirmedHistoryTap(); // 근형
	*/
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
}
