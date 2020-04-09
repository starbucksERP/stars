package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Store;

public interface StoreMapper {
	int insertStore(Store store);
	int closeStore(int StoreCode);
	int updateStore(Store store);
	List<Store> selectAllStore(Store store);
}
