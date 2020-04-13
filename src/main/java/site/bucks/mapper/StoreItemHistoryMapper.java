package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryMapper {
	int updateReceiptProcess(StoreItemHistory sih);
	int updateCancelProcess(StoreItemHistory sih);
	int insertStoreItemHistory(StoreItemHistory sih);
	List<StoreItemHistory> selectRecipt(StoreItemHistory sih);
	int updateStoreItemHistory();
}
