package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.OrderItem;
import site.bucks.exception.NotSendedFromMainStore;
import site.bucks.exception.UnCommitedCancelOrder;
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
	
//	지점 발주 인풋
	@RequestMapping(value = "/storeOrderInput", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderInput(@RequestBody List<OrderItem> orderItemList) {
		
		for(OrderItem orderItem:orderItemList) {
			storeItemHistoryService.addRecipt(orderItem);
		}
		
		return "success";
	}
	
	
	
	// 발주요청 조회
	@RequestMapping(value = "/storeOrderRequestList", method = RequestMethod.GET)
	public String storeOrderRequestList() {
//		세션을이용하여 지점코드 넣어야함!
		return "storeItem/order_req_list";
	}
	
	// 발주요청 조회 조건검색
	@RequestMapping(value = "/storeOrderRequestList", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderItem> storeOrderRequestList(@RequestBody OrderItem orderItem) { 
//		storeid 조건
		return orderItemService.getOrderItemList(orderItem);
	}

	// 발주요청 취소 
	@RequestMapping(value = "/storeOrderCancel", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderReqCancel(@RequestBody OrderItem orderItem) {
//		storeid 조건
		storeItemHistoryService.modifyCancelRecipt(orderItem);
		return "success";
	}
	
	// 발주요청 확인 
	@RequestMapping(value = "/storeOrderCheck", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderReqConfirm(@RequestBody List<OrderItem> orderItemList)   {
		System.out.println(orderItemList.get(0).getRequestState());
		storeItemHistoryService.modifyReceiptProcess(orderItemList);
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
//		storeId 조건
		return orderItemService.getOrderItemList(orderItem);
	}
	
	
	
	
	@ExceptionHandler(UnCommitedCancelOrder.class)
	public String exceptionHandler(UnCommitedCancelOrder exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "storeItem/order_req_list";
	}
	
	@ExceptionHandler(NotSendedFromMainStore.class)
	public String exceptionHandler(NotSendedFromMainStore exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "storeItem/order_req_list";
	}
	
	
	
}
