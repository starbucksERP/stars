package site.bucks.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.OrderItem;
import site.bucks.service.OrderItemService;

@Controller
public class OrderController {
	@Autowired
	private OrderItemService orderItemService;
	
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
	public String orderReqConfirm(@RequestBody Map<String, Object> param) {
		orderItemService.modifyOrderItemState(param);
		return "success";
	}
	
	// 수량체크해서 구매입력 또는 배송처리 >> 만들어야해
	
	// 발주현황
	@RequestMapping(value = "/orderStateList", method = RequestMethod.GET)
	public String orderStateList() {
		return "order/order_item_list";
	}
	
	// 발주현황 조건검색
	@RequestMapping(value = "/orderStateList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> orderStateList(@RequestBody OrderItem orderItem) { 
		return orderItemService.getOrderItemList(orderItem);
	}

	
	
	
	
	

	@RequestMapping(value = "/purchasePlan")
	public String purchasePlan() {
		return "purchase/purchase_plan";
	}
	@RequestMapping(value = "/purchaseAdd")
	public String purchaseAdd() {
		return "purchase/purchase_add";
	}
	@RequestMapping(value = "/purchaselist")
	public String purchaseList() {
		return "purchase/purchase_list";
	}
	@RequestMapping(value = "/history")
	public String historyList() {
		return "history/history_list";
	}

}
