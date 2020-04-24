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
	public List<Purchase> getDisplayFutureList(Purchase purchase) {
		return purchaseDAO.displayFutureList(purchase);
	}

	@Override
	public List<Purchase> getDisplayPurchaseReq(Purchase purchase) {
		return purchaseDAO.displayPurchaseReq(purchase);
	}
	
	@Override
	public List<Purchase> getDisplayInProcess(Purchase purchase) {
		return purchaseDAO.displayInProcess(purchase);
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
