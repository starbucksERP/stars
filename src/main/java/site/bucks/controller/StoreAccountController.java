package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreAccountController {
	
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
