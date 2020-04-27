package site.bucks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.ItemHistoryDAO;
import site.bucks.dto.ItemHistory;
import site.bucks.dto.Purchase;

@Service
public class ItemHistoryServiceImpl implements ItemHistoryService{
	
	@Autowired
	private ItemHistoryDAO itemHistoryDAO;

	@Override
	public void newPOItemHist(Purchase purchase) {
		itemHistoryDAO.newPOItemHist(purchase);
		
	}

	@Override
	public void updatedPOItemHist(int purchaseSeq) {
		itemHistoryDAO.updatedPOItemHist(purchaseSeq);
		
	}

}
