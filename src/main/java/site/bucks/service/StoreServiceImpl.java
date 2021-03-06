package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.StoreDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.Store;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private StoreItemHistoryDAO storeItemHistoryDAO; 
	
	@Override
	public void addStore(Store store) {
		storeDAO.insertStore(store);
		storeItemHistoryDAO.orerNumInsertStore(store);
	}
/*
	@Override
	public void removeStore(Store store) {
		storeDAO.closeStore(store);
	}
*/
	@Override
	public void modifyStore(Store store) {
		storeDAO.updateStore(store);
	}
	
	@Override
	public Store getStoreId(int storeId) {
		return storeDAO.selectstoreId(storeId);
	}
	
	@Override
	public Store getStoreName(String storeName) {
		return storeDAO.selectStoreName(storeName);
	}

	@Override
	public List<Store> getStoreList(Store store) {
		return storeDAO.selectConditionStoreList(store);
	}
	

	


	
}
