package site.bucks.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.OrderItem;
import site.bucks.service.OrderItemService;
import site.bucks.service.StoreItemHistoryService;

@Controller
@RequestMapping("/sic")
public class StoreItemHistoryController {
	@Autowired
	private StoreItemHistoryService storeItemHistoryService;
	
	@Autowired
	private OrderItemService orderItemService;
	
	@RequestMapping(value = "/storeReceipt")
	public String receiptList() {
		return "storeItem/receipt_list";
	}
	
	
	

//	지점 발주 입력페이지
	@RequestMapping(value = "/storeOrderInput",method = RequestMethod.GET)
	public String storeOrderInput() {
		return "storeItem/order_input";
	}
	
//	지점 발주 요청
	@RequestMapping(value = "/storeOrderInput", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderInput(@RequestBody List<OrderItem> orderItemList) {
		
		for(OrderItem orderItem:orderItemList) {
			storeItemHistoryService.addRecipt(orderItem);
		}
		
		return "success";
	}
	
	
	
	// 발주요청
	@RequestMapping(value = "/storeOrderRequestList", method = RequestMethod.GET)
	public String storeOrderRequestList() {
//		세션을이용하여 지점코드 넣어야함!
		
		return "storeItem/order_req_list";
	}
	
	// 발주요청 조건검색
	@RequestMapping(value = "/storeOrderRequestList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> storeOrderRequestList(@RequestBody OrderItem orderItem) { 
//		storeid 조건
		return orderItemService.getOrderItemList(orderItem);
	}

	// 발주요청확인 및 취소
	@RequestMapping(value = "/storeOrderModify", method = RequestMethod.PUT)
	@ResponseBody
	public String storeOrderReqConfirm(@RequestBody Map<String, Object> param) {
		orderItemService.modifyOrderItemState(param);
		return "success";
	}
	
	
	
	// 발주현황
	@RequestMapping(value = "/storeOrderStateList", method = RequestMethod.GET)
	public String storeOrderStateList() {
//		세션을이용하여 지점코드 넣어야함!
		
		return "storeItem/order_item_list";
	}
	
	// 발주현황 조건검색
	@RequestMapping(value = "/storeOrderStateList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> storeOrderStateList(@RequestBody OrderItem orderItem) { 
		return orderItemService.getOrderItemList(orderItem);
	}
	
	
	
}
