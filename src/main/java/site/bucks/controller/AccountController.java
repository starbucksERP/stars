package site.bucks.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.StoreItemHistory;
import site.bucks.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
//	지점 매입현황 
	@RequestMapping("/st_accountPurchase")
	public String storeAccountPurchase() {
		return "accounting/store_account_purchase";
	}
	
	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> st_accountPurchaseList() {
		StoreItemHistory sih= new StoreItemHistory();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("storePurchaseList",accountService.getPurchaseSaleList(sih));
		return returnMap;
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
	
	
	//매입 - 본사 
	@RequestMapping(value = "/accountPurchase")
	public String a5() {
		return "accounting/account_purchase";
	}
	
	//매출 - 본사
	@RequestMapping(value = "/accountSales")
	public String a6() {
		return "accounting/account_sales";
	}
	
	//손익분석 - 본사 
	@RequestMapping(value = "/accountIncome")
	public String a4() {
		return "accounting/account_income";
	}
	
	//지점들 매입월별 현황 - 본사 
	@RequestMapping(value = "/purchaseMonth")
	public String a7() {
		return "accounting/purchase_month";
	}
	
	//지점들 매출월별 현황 - 본사 
	@RequestMapping(value = "/salesMonth")
	public String a8() {
		return "accounting/sales_month";
	}
	
	//지점들 손익분석 - 본사 
	@RequestMapping(value = "/incomeMonth")
	public String a9() {
		return "accounting/income_month";
	}
	

}
