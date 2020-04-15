package site.bucks.mapper;

import java.util.List;
import java.util.Map;

import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryMapper {
	List<StoreItemHistory> selectReciptList();
	List<StoreItemHistory> selectReciptConditionList(Map<String, Object> map);
	int updateReceiptProcess(StoreItemHistory sih);
	int updateCancelProcess(StoreItemHistory sih);
	int insertStoreItemHistory(StoreItemHistory sih);
	StoreItemHistory selectState10(StoreItemHistory sih);
	int updateStoreItemHistory(StoreItemHistory sih);
}
