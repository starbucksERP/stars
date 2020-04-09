package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//		�귣ġ �׽�Ʈ1
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template() {
		return "home";
	}
	
//	�����ϰ���
	@RequestMapping(value = "/receipt")
	public String receiptList() {
		return "receipt/receipt_list";
	}
	
	
//	�ֹ�����
	@RequestMapping(value = "/orderReq")
	public String orderReq() {
		return "order/order_req_list";
	}
	
	@RequestMapping(value = "/orderSta")
	public String orderSta() {
		return "order/order_sta_list";
	}
	
	
//	������
	@RequestMapping(value = "/productList")
	public String productList() {
		return "item/product_list";
	}
	
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	
	
//	��۰���
	@RequestMapping(value = "/deliveryList")
	public String deliveryList() {
		return "delivery/delivery_list";
	}
	
	@RequestMapping(value = "/deliveryReq")
	public String deliveryReq() {
		return "delivery/delivery_req_list";
	}
	
	
//	���Ű���
	@RequestMapping(value = "/buyIn")
	public String buyIn() {
		return "buy/buy_input";
	}
	
	@RequestMapping(value = "/buyPlan")
	public String buyPlan() {
		return "buy/buy_plan";
	}
	
	
	
}











