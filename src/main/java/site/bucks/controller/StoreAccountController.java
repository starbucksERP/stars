package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreAccountController {
	
//	지점 매입현황 
	@RequestMapping(value = "/st_accountPurchase")
	public String st_accountPurchase() {
		return "accounting/store_account_purchase";
	}
	
//	지점 매출현황
	@RequestMapping(value = "/st_accountSales")
	public String st_accountSales() {
		return "accounting/store_account_sales";
	}	
	
//	지점 손익분석
	@RequestMapping(value = "/st_accountIncome")
	public String st_accountIncome() {
		return "accounting/store_account_income";
	}
	

}
