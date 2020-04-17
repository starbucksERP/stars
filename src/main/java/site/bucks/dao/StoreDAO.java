package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Store;

public interface StoreDAO {
	int insertStore(Store store);
	/* int closeStore(Store store); */
	int updateStore(Store store);
	Store selectstoreId(int storeId);
	Store selectStoreName(String storeName);
	List<Store> selectConditionStoreList(Store store);
}
