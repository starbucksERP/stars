package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryService {
	List<StoreItemHistory> getReciptSta(AppliedOrderSta orderSta);
	void addRecipt(List<StoreItemHistory> sihList);
	void modifyRecipt(List<StoreItemHistory> sihList);
	void modifyCancelRecipt(List<StoreItemHistory> sihList);
	void modifyReceiptProcess(StoreItemHistory sih);
}
