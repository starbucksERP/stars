package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Sale;
//		�귣ġ �׽�Ʈ 1
//		�귣ġ �׽�Ʈ 2
//		�귣ġ �׽�Ʈ4444
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
	
	

	
	@RequestMapping(value = "/saleRecord")
	public String s1() {
		return "sale/sale_record";
	}
	
	@RequestMapping(value = "/saleList")
	public String s2() {
		return "sale/sale_list";
	}
	
//	ȸ�� 
	@RequestMapping(value = "/accountAccount")
	public String a1() {
		return "accounting/search_account";
	}
	
	@RequestMapping(value = "/accountProduct")
	public String a2() {
		return "accounting/search_saleProduct";
	}
	
	@RequestMapping(value = "/accountStore")
	public String a3() {
		return "accounting/search_store";
	}
	
	@RequestMapping(value = "/accountIncome")
	public String a4() {
		return "accounting/account_income";
	}
	
	@RequestMapping(value = "/accountPurchase")
	public String a5() {
		return "accounting/account_purchase";
	}
	
	@RequestMapping(value = "/accountSales")
	public String a6() {
		return "accounting/account_sales";
	}
	
	@RequestMapping(value = "/purchaseMonth")
	public String a7() {
		return "accounting/purchase_month";
	}
	
	@RequestMapping(value = "/salesMonth")
	public String a8() {
		return "accounting/sales_month";
	}
	
	@RequestMapping(value = "/incomeMonth")
	public String a9() {
		return "accounting/income_month";
	}
	

}











