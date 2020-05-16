package site.bucks.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.PurchaseDAO;
import site.bucks.dto.Purchase;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseDAO purchaseDAO;

	
	@Override
	public List<Purchase> getSearchPurchaseList(Purchase purchase) {
		return purchaseDAO.searchPurchaseList(purchase);
	}

	@Override
	public void purchaseReqConfirm(int purchaseSeq) {
		purchaseDAO.purchaseReqConfirm(purchaseSeq);
		
	}
	
	@Override
	public void purchaseComplete(int purchaseSeq) {
		purchaseDAO.purchaseComplete(purchaseSeq);
		
	}
	
	@Override
	public void purchaseCompleteHQ(int purchaseSeq) {
		purchaseDAO.purchaseCompleteHQ(purchaseSeq);
		
	}
	
	@Override
	public void purchaseCancel(int purchaseSeq) {
		purchaseDAO.purchaseCancel(purchaseSeq);
		
	}

	@Override
	public void insertPurchaseOrder(Purchase purchase) {
		purchaseDAO.insertPurchaseOrder(purchase);
		
	}

	@Override
	public void insertDeliveryFromPurchase(String requestNum) {
		purchaseDAO.insertDeliveryFromPurchase(requestNum);
		
	}

	@Override
	public void updateQtyFromPurchase(int purchaseSeq) {
		purchaseDAO.updateQtyFromPurchase(purchaseSeq);
		
	}

	
	// 자동주문
	@Override
	public List<Purchase> getPurchseByPlan(String today) {
		return purchaseDAO.selectPurchseByPlan(today);
	}
	

}
