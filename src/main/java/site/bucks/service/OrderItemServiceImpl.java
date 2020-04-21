package site.bucks.service;

import java.util.List;

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
	public void insertStoreOrder(OrderItem orderItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<OrderItem> selectStoreOrderItemList(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrderReceiptProcess(OrderItem orderItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		oderItemDAO.updateOrderItem(orderItem);
	}

	@Override
	public List<OrderItem> selectOrderItemList(OrderItem orerItem) {
		return oderItemDAO.selectOrderItemList(orerItem);
	}

	@Override
	public List<OrderItem> selectOrderItems(String requestNum) {
		return oderItemDAO.selectOrderItems(requestNum);
	}

	// 추후 인터셉터로 변경
	@Override
	public void checkQty(String requestNum) {
		List<OrderItem> oderItems=oderItemDAO.selectOrderItems(requestNum);
		boolean possible=true;
		String Pnum="P"+System.currentTimeMillis();
		for (OrderItem order:oderItems) {
			int currentQty=itemDAO.selectItemQty(order.getItemNum());
			if(order.getOrderQty()>=currentQty) {
				Purchase purchase=new Purchase();
				purchase.setRequestNum(Pnum);
				purchase.setItemNum(order.getItemNum());
				purchase.setItemQty(order.getOrderQty());
				purchase.setItemPprice(order.getItemPprice());
				purchase.setPurchaseType(0);
				purchaseDAO.insertPurchaseRequest(purchase);
				possible=false;
			}
		}
		
		OrderItem order=new OrderItem();
		if(possible==true) {
			order.setRequestState(40); // 배송요청
			order.setRequestNum(requestNum);
			updateOrderItem(order);
		} else {
			order.setRequestState(30); // 구매요청
			order.setRequestNum(requestNum);
			updateOrderItem(order);
		}
		
	}

}
