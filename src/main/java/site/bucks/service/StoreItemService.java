package site.bucks.service;

import java.util.List;

import site.bucks.dto.Sale;

public interface StoreItemService {
	void addSale(Sale sale);
	void removeSale(Sale sale);
	List<Sale> getSaleList(Sale sale);
}
