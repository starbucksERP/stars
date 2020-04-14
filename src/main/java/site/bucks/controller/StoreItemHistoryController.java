package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import site.bucks.service.StoreItemHistoryService;

@Controller
public class StoreItemHistoryController {
	@Autowired
	private StoreItemHistoryService storeItemHistoryService;
	
	@RequestMapping(value = "/storeReceipt")
	public String receiptList() {
		return "storeItem/receipt_list";
	}
	
	@RequestMapping(value = "/storeOrderReq")
	public String storeOrderReq() {
		return "storeItem/order_req";
	}
	
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta() {
		return "storeItem/order_status";
	}
	
	@RequestMapping(value = "/storeOrderInput")
	public String storeOrderInput() {
		return "storeItem/order_input";
	}
	
	
	
}
