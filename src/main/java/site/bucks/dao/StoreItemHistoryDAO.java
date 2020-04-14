package site.bucks.dao;

import java.util.List;

import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryDAO {
	List<StoreItemHistory> selectReciptList();
	int updateReceiptProcess(StoreItemHistory sih);
	int updateCancelProcess(StoreItemHistory sih);
	int insertStoreItemHistory(StoreItemHistory sih);
	StoreItemHistory selectState10(StoreItemHistory sih);
	int updateStoreItemHistory(StoreItemHistory sih);
}
