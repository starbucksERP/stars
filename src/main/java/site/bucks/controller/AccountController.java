package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import site.bucks.dto.Account;
import site.bucks.service.AccountService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
//	지점 매입현황 
	@RequestMapping(value = "/st_accountPurchase")
	public String st_accountPurchase(@ModelAttribute Account account, Model model) {
		model.addAttribute("accountPSList", accountService.getPurchaseSaleList(account));   
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
