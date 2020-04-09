package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//		宏罚摹 抛胶飘1
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template() {
		return "home";
	}
	
//	涝免窍包府
	@RequestMapping(value = "/receipt")
	public String receiptList() {
		return "receipt/receipt_list";
	}
	
	
//	林巩包府
	@RequestMapping(value = "/orderReq")
	public String orderReq() {
		return "order/order_req_list";
	}
	
	@RequestMapping(value = "/orderSta")
	public String orderSta() {
		return "order/order_sta_list";
	}
	
	
//	犁绊包府
	@RequestMapping(value = "/productList")
	public String productList() {
		return "item/product_list";
	}
	
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	
	
//	硅价包府
	@RequestMapping(value = "/deliveryList")
	public String deliveryList() {
		return "delivery/delivery_list";
	}
	
	@RequestMapping(value = "/deliveryReq")
	public String deliveryReq() {
		return "delivery/delivery_req_list";
	}
	
	
//	备概包府
	@RequestMapping(value = "/buyIn")
	public String buyIn() {
		return "buy/buy_input";
	}
	
	@RequestMapping(value = "/buyPlan")
	public String buyPlan() {
		return "buy/buy_plan";
	}
	
	
	
}











