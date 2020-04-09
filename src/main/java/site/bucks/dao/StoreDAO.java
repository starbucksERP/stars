package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreDAO {
	int insertStore(Store store);
	int closeStore(int storeCode);
	int updateStore(Store store);
	List<Store> selectAllStore(Store store);
}
