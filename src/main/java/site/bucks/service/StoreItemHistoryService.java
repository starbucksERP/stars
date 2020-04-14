package site.bucks.service;

import java.util.List;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemHistoryService {
	void addRecipt(List<StoreItemHistory> sihList);
	void modifyRecipt(List<StoreItemHistory> sihList);
	void modifyCancelRecipt(List<StoreItemHistory> sihList);
	void modifyReceiptProcess(StoreItemHistory sih);
}
