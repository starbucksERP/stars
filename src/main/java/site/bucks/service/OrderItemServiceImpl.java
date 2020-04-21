package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.ItemDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dto.OrderItem;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	@Autowired
	private OrderItemDAO oderItemDAO;
	@Autowired
	private ItemDAO itemDAO;

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
		
		for (OrderItem order:oderItems) {
			int currentQty=itemDAO.selectItemQty(order.getItemNum());
			
			if(order.getOrderQty()<=currentQty) {
				// 상태 40 : 배송요청
				order.setRequestState(40);
			} else {
				// 상태30 : 구매요청
				order.setRequestState(30);
			}
			
		}
		
		
		
		
	}

}
