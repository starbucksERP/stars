package site.bucks.mapper;

import site.bucks.dto.Purchase;

public interface ItemHistoryMapper {
	
<<<<<<< HEAD
	// 새로운 발주에 대한 히스토리 insert (본사직접주문)
	int newPOItemHist(Purchase purchase);
	
	// 상태가 변경된 purchase에 대한 히스토리 insert
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
