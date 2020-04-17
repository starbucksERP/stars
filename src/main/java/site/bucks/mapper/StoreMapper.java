package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreMapper {
	int insertStore(Store store);
	/* int closeStore(Store store); */
	int updateStore(Store store);
	Store selectstoreId(int storeId);
	Store selectStoreName(String storeName);
	List<Store> selectAllStore();
}
