package site.bucks.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Hewon;
import site.bucks.dto.Item;
import site.bucks.dto.ItemHistory;
import site.bucks.dto.OrderItem;
import site.bucks.service.ItemHistoryService;
import site.bucks.service.OrderItemService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private ItemHistoryService itemHistoryService;
	
	// 발주요청
	@RequestMapping(value = "/orderRequestList", method = RequestMethod.GET)
	public String orderReqList() {
		return "order/order_req_list";
	}
	
	// 발주요청 조건검색
	@RequestMapping(value = "/orderRequestList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> orderReqList(@RequestBody OrderItem orderItem) { 
		return orderItemService.getOrderItemList(orderItem);
	}

	// 발주요청확인 
	@RequestMapping(value = "/orderReqConfirm", method = RequestMethod.PUT)
	@ResponseBody
	public String orderReqConfirm(@RequestBody Map<String, Object> param, HttpSession session) {
		orderItemService.modifyOrderItemState(param);  //20
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		String userName=loginHewon.getHewonName();
		
		List reqNums=(List)param.get("reqNums");
		if (reqNums.size()==1) {
			String num=(String)reqNums.get(0);
			orderItemService.addHistory(num, 20, userName);
			orderItemService.modifyOrderStateByCheckQty(num,userName);
		} else {
			for (int i=0; i<reqNums.size(); i++) {
				String num=(String)reqNums.get(i);
				orderItemService.addHistory(num, 20, userName);
				orderItemService.modifyOrderStateByCheckQty(num,userName);
			}
		}
		
		return "success";
	}
	
	@RequestMapping(value = "/orderStateList", method = RequestMethod.GET)
	public String orderStateList() {
		return "order/order_item_list";
	}
	
	@RequestMapping(value = "/orderStateList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> orderStateList(@RequestBody OrderItem orderItem) { 
		return orderItemService.getOrderItemList(orderItem);
	}

	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String historyList() {
		return "history/history_list";
	}
	
	@RequestMapping(value = "/history", method = RequestMethod.POST)
	@ResponseBody 
	public List<ItemHistory> historyList(@RequestBody ItemHistory itemHistory) {
		return itemHistoryService.getItemHistoryist(itemHistory);
	}
	
	/*
	// history Insert
	@RequestMapping(value = "/historyAdd", method = RequestMethod.POST)
	@ResponseBody
	public String historyAdd(@RequestBody List<ItemHistory> historyList, HttpSession session) {
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		String UserName=loginHewon.getHewonName();
		for (ItemHistory history:historyList) {
			history.setHistoryOwner(UserName);
			itemHistoryService.addItemHistory(history);
		}
		return "success";
	}*/
	/*ggg
	
	@RequestMapping(value = "/historyAdd", method = RequestMethod.POST)
	@ResponseBody
	public String historyAdd(@RequestBody String[] reqNums, HttpSession session) {
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		String user=loginHewon.getHewonName();
		List<OrderItem> orders=null;
		for (String temp:reqNums) {
			orders=orderItemService.getOrderItems(temp);
		}
		for (OrderItem order:orders) {
			ItemHistory history=new ItemHistory();
			history.setRequestNum(order.getRequestNum());
			history.setItemNum(order.getItemNum());
			history.setItemState(order.getRequestState());
			history.setItemQty(order.getOrderQty());
			history.setPurchaseType(order.getOrderType());
			history.setHistoryOwner("");
			itemHistoryService.addItemHistory(history);
		}
		
		return "success";
	}
	*/
	
	

}
