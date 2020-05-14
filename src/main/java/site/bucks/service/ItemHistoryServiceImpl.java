package site.bucks.service;

import java.util.List;

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
	public void updatedPOItemHist(String requestNum) {
		itemHistoryDAO.updatedPOItemHist(requestNum);
		
	}

	@Override
	public List<ItemHistory> getItemHistoryist(ItemHistory history) {
		return itemHistoryDAO.selectItemHistoryist(history);
	}

	@Override
	public void addItemHistory(ItemHistory history) {
		itemHistoryDAO.insertItemHistory(history);
		
	}

}
