package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.ItemHistoryDAO;
import site.bucks.dto.ItemHistory;

@Service
public class ItemHistoryServiceImpl implements ItemHistoryService{
	@Autowired
	private ItemHistoryDAO itemHistoryDAO;
	
	@Override
	public void addItemHistory(ItemHistory itemHistory) {
		itemHistoryDAO.insertItemHistory(itemHistory);
	}

	@Override
	public List<ItemHistory> getItemHistoryist(ItemHistory itemHistory) {
		return itemHistoryDAO.selectItemHistoryist(itemHistory);
	}
	

}
