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
<<<<<<< HEAD
	public void newPOItemHist(Purchase purchase) {
		itemHistoryDAO.newPOItemHist(purchase);
		
=======
	public void addItemHistory(ItemHistory itemHistory) {
		itemHistoryDAO.insertItemHistory(itemHistory);
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
	}

	@Override
<<<<<<< HEAD
	public void updatedPOItemHist(int purchaseSeq) {
		itemHistoryDAO.updatedPOItemHist(purchaseSeq);
		
	}
=======
	public List<ItemHistory> getItemHistoryist(ItemHistory itemHistory) {
		return itemHistoryDAO.selectItemHistoryist(itemHistory);
	}
	
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git

}
