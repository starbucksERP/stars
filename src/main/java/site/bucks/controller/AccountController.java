package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Account;
import site.bucks.dto.Item;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;
import site.bucks.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	
	
//	지점 매입현황 
	@RequestMapping(value = "/st_accountPurchase", method = RequestMethod.GET)
	public String st_accountPurchase() {
		return "accounting/store_account_purchase";
	}
	

	@RequestMapping(value = "/st_accountPurchase",method = RequestMethod.POST)
	@ResponseBody
	public List<Account> st_accountPurchase(@RequestBody StoreItemHistory sih) {
		//System.out.println(accountDate1+" ~ "+accountDate2);
		return accountService.getPurchaseSaleList(sih);
	}
	
//	지점 매출현황
	@RequestMapping(value = "/st_accountSales", method = RequestMethod.GET)
	public String storeAccountSales() {
		return "accounting/store_account_sales";
	}
	
	@RequestMapping(value = "/st_accountSales",method = RequestMethod.POST)
	@ResponseBody
	public List<Account> storeAccountSales(@RequestBody Sale s) {
		return accountService.getStSaleList(s);
	}	
	
	
//	 본사 매입현황
	@RequestMapping(value = "/accountPurchase", method = RequestMethod.GET)
	public String accountPurchase() {
		return "accounting/account_purchase";
	}
	
	@RequestMapping(value = "/accountPurchase", method = RequestMethod.POST)
	@ResponseBody
	public List<Account> accountPurchase(@RequestBody Purchase p) {
		return accountService.getMainPurchaseList(p);
	}
	
//	본사 매출현황
	@RequestMapping(value = "/accountSales", method = RequestMethod.GET)
	public String accountSales() {
		return "accounting/account_sales";
	}	
	
	
	@RequestMapping(value = "/accountSales", method = RequestMethod.POST)
	@ResponseBody
	public List<Account> accountSales(@RequestBody StoreItemHistory sih) {
		return accountService.getMainSaleList(sih);
	}	
	
	
//	본사 손익분석

	@RequestMapping(value = "/accountIncome", method = RequestMethod.GET)
	public String accountIncome() {
		return "accounting/account_income";
	}
	
/*
	@RequestMapping(value = "/accountIncome2",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> accountIncome2() {
		
		
		return accountService.getAccountIncome();
	}
	
*/	
	

	
//	지점 매출현황
	@RequestMapping(value = "/st_accountSales")
	public String st_accountSales() {
		return "accounting/store_account_sales";
	}	
	
	@RequestMapping(value = "/st_accountIncome")
	public String st_accountIncome() {
		return "accounting/store_account_income";
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
