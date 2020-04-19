package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.ItemHistory;

public interface ItemHistoryMapper {
	
	int insertItemHistory (ItemHistory itemHistory); // 근형
	List<ItemHistory> recentHistoryList(); // 근형
	List<ItemHistory> selectItemHistoryList(); // 근형
	List<ItemHistory> allHistoryTap(); // 근형
	List<ItemHistory> goodsReceivedHistoryTap(); // 근형
	List<ItemHistory> goodsShippedHistoryTap(); // 근형
	List<ItemHistory> requestConfirmedHistoryTap(); // 근형
	

}
