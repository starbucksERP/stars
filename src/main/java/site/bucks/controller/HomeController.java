package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Sale;
//		브랜치 테스트 1
//		브랜치 테스트 2
//		브랜치 테스트 3
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template() {
		return "home";
	}
	
//	입출하관리
	@RequestMapping(value = "/receipt")
	public String receiptList() {
		return "receipt/receipt_list";
	}
	
	
//	주문관리
	@RequestMapping(value = "/orderReq")
	public String orderReq() {
		return "order/order_req_list";
	}
	
	@RequestMapping(value = "/orderSta")
	public String orderSta() {
		return "order/order_sta_list";
	}
	
	
//	재고관리
	@RequestMapping(value = "/productList")
	public String productList() {
		return "item/product_list";
	}
	
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	
	
//	배송관리
	@RequestMapping(value = "/deliveryList")
	public String deliveryList() {
		return "delivery/delivery_list";
	}
	
	@RequestMapping(value = "/deliveryReq")
	public String deliveryReq() {
		return "delivery/delivery_req_list";
	}
	
	
//	구매관리
	@RequestMapping(value = "/buyIn")
	public String buyIn() {
		return "buy/buy_input";
	}
	
	@RequestMapping(value = "/buyPlan")
	public String buyPlan() {
		return "buy/buy_plan";
	}
	
	
	@RequestMapping(value = "/saleList")
	public String afer() {
		return "sale/sale_list";
	}
	
}











