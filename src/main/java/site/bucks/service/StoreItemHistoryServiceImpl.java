package site.bucks.service;

import java.util.List;

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
	
//	���� ���	(�Ű����� �迭�� �޾Ƽ� ó�� -  �׽�Ʈ ����)
	@Override
	public void addRecipt(List<StoreItemHistory> sihList) {
		for(StoreItemHistory sih:sihList) {
			storeItemHistoryDAO.insertStoreItemHistory(sih);
			orderItemDAO.insertOrderItemByStore(sih);
		}
	}
	
	
//	���� ����� ������[���� 10�� ��츸] �޼ҵ�	(�Ű����� �迭�� �޾Ƽ� ó�� -  �׽�Ʈ ����)
	@Override
	public void modifyRecipt(List<StoreItemHistory> sihList) {
		if(sihList.size()==0) {
			throw new RuntimeException("������ ���ְ� �����ϴ�.");	
		}
		
		for(StoreItemHistory sih:sihList) {
			
//			SIH �� ���� ���� ���� 		sih�� �ű� ���� ����
			StoreItemHistory SIH=storeItemHistoryDAO.selectState10(sih);
			
			if(SIH==null) {
				throw new RuntimeException("�̹� ���ְ� ��������ϴ�.");
			}
			
//			���������� �ű������� ���ٸ� �޼ҵ� ȸ��
			if(SIH.getItemNum().equals(sih.getItemNum()) && SIH.getItemQty()==sih.getItemQty()) {
				continue;
			}else {
//				�������� �����ϰ�
				storeItemHistoryDAO.updateStoreItemHistory(sih);
				
				orderItemDAO.updateOrderItemByStore(sih);
			}
		}
	}
	
	@Override
	public void modifyCancelRecipt(List<StoreItemHistory> sihList) {
		if(sihList.size()==0) {
			throw new RuntimeException("����� ���ְ� �����ϴ�.");	
		}
		
		for(StoreItemHistory sih:sihList) {
			if(storeItemHistoryDAO.selectState10(sih).getItemState()!=10) {
				throw new RuntimeException("�̹� ���ְ� ��������ϴ�.");
			}else {
				storeItemHistoryDAO.updateCancelProcess(sih);
			}
		}
	}
	
	
//	������ ��ǰ ���Ͻ� �Ͼ�� �޼ҵ�
	@Override
	public void modifyReceiptProcess(StoreItemHistory sih) {
//		�������ֻ��º���
		storeItemHistoryDAO.updateReceiptProcess(sih);
//		��ۻ��º���
		deliveryDAO.updateDeliveryReceiptProcess(sih);
//		�ֹ����º���
		orderItemDAO.updateOrderReceiptProcess(sih);
//		��������������
		storeItemDAO.updateStoreItemReceiptProcess(sih);
	}



}
