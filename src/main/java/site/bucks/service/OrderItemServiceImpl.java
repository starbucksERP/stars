package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.ItemDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.PurchaseDAO;
import site.bucks.dto.Delivery;
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
   
   @Override
   public List<OrderItem> getStoreOrderItems(String requestNum, String storeId) {
      return oderItemDAO.selectStoreOrderItems(requestNum, storeId);
   }
   
//   ================================================================


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
   public void modifyOrderStateByCheckQty(String requestNum) {
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
      } else { 
         Map<String, Object> stayDelivery=new HashMap<String, Object>();
         stayDelivery.put("requestState", 30);
         stayDelivery.put("requestNum", requestNum);
         modifyOrderItemState(stayDelivery);
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