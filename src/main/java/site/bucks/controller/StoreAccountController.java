package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class StoreAccountController {
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
	
	
	
	
//	���� ������Ȳ 
	@RequestMapping(value = "/st_accountPurchase")
	public String st_accountPurchase() {
		return "accounting/store_account_purchase";
	}
	
//	���� ������Ȳ
	@RequestMapping(value = "/st_accountSales")
	public String st_accountSales() {
		return "accounting/store_account_sales";
	}	
	
//	���� ���ͺм�
	@RequestMapping(value = "/st_accountIncome")
	public String st_accountIncome() {
		return "accounting/store_account_income";
	}
	
	
	

}
