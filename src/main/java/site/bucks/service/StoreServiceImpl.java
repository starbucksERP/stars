package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.StoreDAO;
import site.bucks.dto.Store;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public void addStore(Store store) {
		storeDAO.insertStore(store);
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
	public List<Store> getStoreList() {
		return storeDAO.selectAllStore();
	}


	
}
