package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;
import site.bucks.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
//	���� ������Ȳ 
	@RequestMapping("/st_accountPurchase")
	public String storeAccountPurchase() {
		return "accounting/store_account_purchase";
	}
	
//	지점 매입 조회(GET)
	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.GET)
	public String st_accountPurchaseList() {
		return "accounting/store_account_purchase";
	}
//	지점 매입 조회(POST)
	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.POST)
	@ResponseBody
	public List<Account> st_accountPurchaseList(@RequestBody StoreItemHistory sih) {
		return accountService.getPurchaseSaleList(sih);
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
	
	
	//���� - ���� 
	@RequestMapping(value = "/accountPurchase")
	public String a5() {
		return "accounting/account_purchase";
	}
	
	//���� - ����
	@RequestMapping(value = "/accountSales")
	public String a6() {
		return "accounting/account_sales";
	}
	
	//���ͺм� - ���� 
	@RequestMapping(value = "/accountIncome")
	public String a4() {
		return "accounting/account_income";
	}
	
	//������ ���Կ��� ��Ȳ - ���� 
	@RequestMapping(value = "/purchaseMonth")
	public String a7() {
		return "accounting/purchase_month";
	}
	
	//������ ������� ��Ȳ - ���� 
	@RequestMapping(value = "/salesMonth")
	public String a8() {
		return "accounting/sales_month";
	}
	
	//������ ���ͺм� - ���� 
	@RequestMapping(value = "/incomeMonth")
	public String a9() {
		return "accounting/income_month";
	}
	

}
