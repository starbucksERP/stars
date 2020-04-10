package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreMapper {
	int insertStore(Store store);
	int closeStore(int storeCode);
	int updateStore(Store store);
	Store selectStoreCode(int storeCode);
	Store selectStoreName(String storeName);
	List<Store> selectAllStore(Store store);
}
