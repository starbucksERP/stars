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

	@Override
	public void closeStore(int storeCode) {
		storeDAO.closeStore(storeCode);
	}

	@Override
	public void modifyStore(Store store) {
		storeDAO.updateStore(store);
	}

	@Override
	public List<Store> getStoreList(Store store) {
		return storeDAO.selectAllStore(store);
	}


	
}
