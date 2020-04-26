package site.bucks.service;

import site.bucks.dto.Purchase;

public interface ItemHistoryService {
<<<<<<< HEAD
	
	void newPOItemHist(Purchase purchase);
	void updatedPOItemHist(int purchaseSeq);
	
=======
	void addItemHistory (ItemHistory itemHistory); 
	List<ItemHistory> getItemHistoryist(ItemHistory itemHistory);

	
	/*
	List<ItemHistory> getRecentHistoryList();
	List<ItemHistory> getItemHistoryList(ItemHistory itemHistory); // 다중검색을 위한 서비스 메소드 이거빼고 다른 select문은 매개변수 없음
	List<ItemHistory> getAllHistoryList();
	List<ItemHistory> getGoodsReceivedList();
	List<ItemHistory> getGoodsShippedList();
	List<ItemHistory> getRequestConfirmedList();
	*/
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
}
