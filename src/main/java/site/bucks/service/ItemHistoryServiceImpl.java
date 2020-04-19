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
	public List<ItemHistory> getRecentHistoryList() {
		return itemHistoryDAO.recentHistoryList(); 
	}

	@Override
	public List<ItemHistory> getItemHistoryList(ItemHistory itemHistory) {
		return itemHistoryDAO.selectItemHistoryList(itemHistory);
	}

	@Override
	public List<ItemHistory> getAllHistoryList() {
		return itemHistoryDAO.allHistoryTap();
	}

	@Override
	public List<ItemHistory> getGoodsReceivedList() {
		return itemHistoryDAO.goodsReceivedHistoryTap();
	}

	@Override
	public List<ItemHistory> getGoodsShippedList() {
		return itemHistoryDAO.goodsShippedHistoryTap();
	}

	@Override
	public List<ItemHistory> getRequestConfirmedList() {
		return itemHistoryDAO.requestConfirmedHistoryTap();
	}

}
