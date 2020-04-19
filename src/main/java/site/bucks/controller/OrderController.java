package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping(value = "/orderReq")
	public String orderReqList() {
		return "order/order_req_list";
	}
	@RequestMapping(value = "/orderList")
	public String orderItemList() {
		return "order/order_item_list";
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

}
