package site.bucks.service;

import java.util.List;

import site.bucks.dto.ItemHistory;

public interface ItemHistoryService {
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
}
