package site.bucks.service;

import java.util.List;

import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;

public interface StoreItemService {
	void addSale(Sale sale);
	void removeSale(Sale sale);
	List<Sale> getSaleList(Sale sale);
	
	ProductRecipe getProductName(String saleProduct);
	List<ProductRecipe> getProductCategory(String category);
	ProductRecipe getProductName2(String itemNum);
	
	
	 List<StoreItem> getStoreItemList(StoreItem storeItem);
	 StoreItem getStoreItem(StoreItem storeItem);
	 void removeStoreItem(StoreItem storeItem);
	 void modifyStoreItem(StoreItem storeItem);
	 
	 
}
