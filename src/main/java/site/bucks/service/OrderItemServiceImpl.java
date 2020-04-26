package site.bucks.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.ItemDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.PurchaseDAO;
import site.bucks.dto.OrderItem;
import site.bucks.dto.Purchase;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	@Autowired
	private OrderItemDAO oderItemDAO;
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private PurchaseDAO purchaseDAO;
	
	@Override
	public List<OrderItem> getStoreOrderItems(String requestNum, String storeId) {
		return oderItemDAO.selectStoreOrderItems(requestNum, storeId);
	}
	
//	================================================================


	@Override
	public void modifyOrderItemState(Map<String, Object> numAndStateMap) {
		oderItemDAO.updateOrderItemState(numAndStateMap);
	}

	@Override
	public List<OrderItem> getOrderItemList(OrderItem orderItem) {
		return oderItemDAO.selectOrderItemList(orderItem);
	}

	@Override
	public List<OrderItem> getOrderItems(String requestNum) {
		return oderItemDAO.selectOrderItems(requestNum);
	}

	// 추후 인터셉터로 변경
	@Override
	public void checkQty(String requestNum) {
		List<OrderItem> oderItems=oderItemDAO.selectOrderItems(requestNum);
		boolean possible=true;
		String Pnum="P"+System.currentTimeMillis(); // 구매요청번호 재작성
		for (OrderItem order:oderItems) {
			int currentQty=itemDAO.selectItemQty(order.getItemNum());
			if(order.getOrderQty()>=currentQty) {
				Purchase purchase=new Purchase();
				purchase.setRequestNum(Pnum);
				purchase.setItemNum(order.getItemNum());
				purchase.setItemQty(order.getOrderQty());
				purchase.setItemPprice(order.getItemPprice());
				purchase.setPurchaseType(0);
				purchaseDAO.insertPurchaseOrder(purchase);
				possible=false;
			}
		}
		
		OrderItem order=new OrderItem();
		if(possible==true) {
			order.setRequestState(40); // 배송요청
			order.setRequestNum(requestNum);
			//modifyOrderItem(order);
		} else {
			order.setRequestState(30); // 구매요청
			order.setRequestNum(requestNum);
			//modifyOrderItem(order);
		}
		
	}





}
