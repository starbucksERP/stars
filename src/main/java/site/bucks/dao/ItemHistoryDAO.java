package site.bucks.dao;

import java.util.List;

import site.bucks.dto.ItemHistory;

public interface ItemHistoryDAO {
	
	int insertItemHistory (ItemHistory itemHistory); // 근형
	List<ItemHistory> recentHistoryList(); // 근형
	List<ItemHistory> selectItemHistoryList(ItemHistory itemHistory); // 근형
	List<ItemHistory> allHistoryTap(); // 근형
	List<ItemHistory> goodsReceivedHistoryTap(); // 근형
	List<ItemHistory> goodsShippedHistoryTap(); // 근형
	List<ItemHistory> requestConfirmedHistoryTap(); // 근형
}
