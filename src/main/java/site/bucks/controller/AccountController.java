package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;
import site.bucks.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	
//	지점 매입현황 
	@RequestMapping(value = "/st_accountPurchase", method = RequestMethod.GET)
	public String storeAccountPurchase() {
		return "accounting/store_account_purchase";
	}
	

	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.POST)
	@ResponseBody
	public List<Account> st_accountPurchaseList(@RequestBody StoreItemHistory sih) {
		//System.out.println(accountDate1+" ~ "+accountDate2);
		return accountService.getPurchaseSaleList(sih);
	}
	

	
	
//	지점 매출현황
//	占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙황
	@RequestMapping(value = "/st_accountSales")
	public String st_accountSales() {
		return "accounting/store_account_sales";
	}	
	
//	占쏙옙占쏙옙 占쏙옙占싶분쇽옙
	@RequestMapping(value = "/st_accountIncome")
	public String st_accountIncome() {
		return "accounting/store_account_income";
	}
	
	
	//占쏙옙占쏙옙 - 占쏙옙占쏙옙 
	@RequestMapping(value = "/accountPurchase")
	public String a5() {
		return "accounting/account_purchase";
	}
	
	//占쏙옙占쏙옙 - 占쏙옙占쏙옙
	@RequestMapping(value = "/accountSales")
	public String a6() {
		return "accounting/account_sales";
	}
	
	//占쏙옙占싶분쇽옙 - 占쏙옙占쏙옙 
	@RequestMapping(value = "/accountIncome")
	public String a4() {
		return "accounting/account_income";
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占쌉울옙占쏙옙 占쏙옙황 - 占쏙옙占쏙옙 
	@RequestMapping(value = "/purchaseMonth")
	public String a7() {
		return "accounting/purchase_month";
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙황 - 占쏙옙占쏙옙 
	@RequestMapping(value = "/salesMonth")
	public String a8() {
		return "accounting/sales_month";
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占싶분쇽옙 - 占쏙옙占쏙옙 
	@RequestMapping(value = "/incomeMonth")
	public String a9() {
		return "accounting/income_month";
	}
	

}
