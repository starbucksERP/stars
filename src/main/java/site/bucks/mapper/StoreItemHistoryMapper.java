package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryMapper {
	List<StoreItemHistory> selectReciptList();
	List<StoreItemHistory> selectReciptConditionList(AppliedOrderSta orderSta);
	int updateReceiptProcess(StoreItemHistory sih);
	int updateCancelProcess(StoreItemHistory sih);
	int insertSIH(OrderItem orderItem);
	StoreItemHistory selectState10(StoreItemHistory sih);
	int updateStoreItemHistory(StoreItemHistory sih);
}
