package site.bucks.service;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreService {
	void addStore(Store store);
	void modifyStore(Store store);
	Store getStoreId(int storeId);
	Store getStoreName(String storeName);
	List<Store> getStoreList(Store store);
	
	
	
	

}
