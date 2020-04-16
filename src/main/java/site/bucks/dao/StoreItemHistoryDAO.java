package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryDAO {
	List<StoreItemHistory> selectReciptList();
	List<StoreItemHistory> selectReciptConditionList(AppliedOrderSta orderSta);
	int updateReceiptProcess(StoreItemHistory sih);
	int updateCancelProcess(StoreItemHistory sih);
	int insertStoreItemHistory(StoreItemHistory sih);
	StoreItemHistory selectState10(StoreItemHistory sih);
	int updateStoreItemHistory(StoreItemHistory sih);
}
