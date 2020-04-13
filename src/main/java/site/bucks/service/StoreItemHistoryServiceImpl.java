package site.bucks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.StoreItemHistory;

@Service
public class StoreItemHistoryServiceImpl implements StoreItemHistoryService{
	@Autowired
	private OrderItemDAO orderItemDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private StoreItemDAO storeItemDAO;
	@Autowired
	private StoreItemHistoryDAO storeItemHistoryDAO;
	
	@Override
	public void modifyReceiptProcess(StoreItemHistory sih) {
		storeItemHistoryDAO.receiptProcess(sih);
		deliveryDAO.deliveryReceiptProcess(sih);
		orderItemDAO.orderReceiptProcess(sih);
		storeItemDAO.storeItemReceiptProcess(sih);
	}

}
