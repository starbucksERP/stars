package site.bucks.mapper;

import site.bucks.dto.Purchase;

public interface ItemHistoryMapper {
	

	// 새로운 발주에 대한 히스토리 insert (본사직접주문)
	int newPOItemHist(Purchase purchase);
	
	// 상태가 변경된 purchase에 대한 히스토리 insert
	int updatedPOItemHist(int purchaseSeq);

	

}
