package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Sale;
import site.bucks.dto.SaleItem;

public interface StoreItemService {
	void addSale(Sale sale);
	List<SaleItem> getSaleList(Sale sale);
	Map<String, Object> getSaleProductName(Sale sale);

}
