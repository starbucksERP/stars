package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.PurchaseDAO;
import site.bucks.dto.Purchase;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseDAO purchaseDAO;

	@Override
	public List<Purchase> getDisplayPurchaseList(Purchase purchase) {
		return purchaseDAO.displayPurchaseList(purchase);
	}
	
	@Override
	public void addPurchaseRequest(Purchase purchase) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void modifyPurchaseState(List<Purchase> purchase) {
		// TODO Auto-generated method stub
		
	}

}
