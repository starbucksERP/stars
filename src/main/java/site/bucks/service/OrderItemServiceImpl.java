package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.ItemDAO;
import site.bucks.dao.ItemHistoryDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.PurchaseDAO;
import site.bucks.dto.Delivery;
import site.bucks.dto.Item;
import site.bucks.dto.ItemHistory;
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
   @Autowired
   private DeliveryDAO deliveryDAO;
   @Autowired
   private ItemHistoryDAO historyDAO;
   
   @Override
   public List<OrderItem> getStoreOrderItems(String requestNum, String storeId) {
      return oderItemDAO.selectStoreOrderItems(requestNum, storeId);
   }
   

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

   @Override
   public void modifyOrderStateByCheckQty(String requestNum, String user) {
      List<OrderItem> oderItems=oderItemDAO.selectOrderItems(requestNum);
      boolean possible=true;
      int StoreId=0;
      
      for (OrderItem order:oderItems) {
         StoreId=order.getStoreId();
         int currentQty=itemDAO.selectItemQty(order.getItemNum());
         if(order.getOrderQty()>=currentQty) {
            Purchase purchase=new Purchase();
            purchase.setRequestNum(requestNum);
            purchase.setItemNum(order.getItemNum());
            purchase.setItemQty(order.getOrderQty());
            purchase.setItemPprice(order.getItemPprice());
            purchase.setPurchaseState(30);
            purchase.setPurchaseType(1);
            purchaseDAO.insertPurchaseOrder(purchase);  
            possible=false;
         }
      }
      
      if(possible) {
         Map<String, Object> goDelivery=new HashMap<String, Object>();
         Delivery delivery=new Delivery();
         delivery.setRequestNum(requestNum);
         delivery.setStoreId(StoreId);
         deliveryDAO.insertDeliveryRequest(delivery);
         goDelivery.put("requestState", 40);
         goDelivery.put("requestNum", requestNum);
         modifyOrderItemState(goDelivery); 
         addHistory(requestNum, 40, user);
      } else { 
         Map<String, Object> stayDelivery=new HashMap<String, Object>();
         stayDelivery.put("requestState", 30);
         stayDelivery.put("requestNum", requestNum);
         modifyOrderItemState(stayDelivery);
         addHistory(requestNum, 30, user);
      }
      
   }

	@Override
	public void addHistory(String reqNum, int state, String user) {
		if (reqNum.substring(0,1).equals("A")) {
			List<Purchase> pList=purchaseDAO.selectPurchseByPlan(reqNum.substring(5));
			for (Purchase p:pList) {
				ItemHistory history=new ItemHistory();
				history.setRequestNum(reqNum);
				history.setItemNum(p.getItemNum());
				history.setItemState(p.getPurchaseState());
				history.setItemQty(p.getItemQty());
				history.setPurchaseType(p.getPurchaseType());
				history.setHistoryOwner(user);
				historyDAO.insertItemHistory(history);
			}
		} else {
			List<OrderItem> orders=getOrderItems(reqNum);
			for (OrderItem order:orders) {
				ItemHistory history=new ItemHistory();
				history.setRequestNum(order.getRequestNum());
				history.setItemNum(order.getItemNum());
				history.setItemState(order.getRequestState());
				history.setItemQty(order.getOrderQty());
				history.setPurchaseType(order.getOrderType());
				history.setHistoryOwner(user);
				historyDAO.insertItemHistory(history);
			}
		}
	}


	@Override
	public void addOrderByMinQty(String today, String user) {
		List<Item> items=itemDAO.selectLowQtyItem();
		if(!items.isEmpty()) {
			for(Item item:items) {
				item.setReqNum("AUTO/"+today);
				purchaseDAO.insertAutoPurchase(item);
			}
			addHistory("AUTO/"+today, 30, user);
		}
		
	}

	   // 근형
		@Override
		public void updateOrderStateFromPurchase(String requestNum) {
			oderItemDAO.updateOrderStateFromPurchase(requestNum);
			
		}

		@Override
		public void updateOrderStateFromDelivery(int deliverySeq) {
			oderItemDAO.updateOrderStateFromDelivery(deliverySeq);
			
		}






}