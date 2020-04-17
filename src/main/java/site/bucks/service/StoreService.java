package site.bucks.service;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreService {
	void addStore(Store store);
	/* void removeStore(Store store); */
	void modifyStore(Store store);
	List<Store> getStoreList();

}
