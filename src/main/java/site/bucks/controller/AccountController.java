package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
=======
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
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
	
<<<<<<< HEAD
	
//	���� ������Ȳ 
	@RequestMapping(value = "/st_accountPurchase", method = RequestMethod.GET)
=======
//	���� ������Ȳ 
	@RequestMapping("/st_accountPurchase")
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
	public String storeAccountPurchase() {
		return "accounting/store_account_purchase";
	}
	
<<<<<<< HEAD
//	������ ���̵� ���޹޾� �ش������� ��µǾ��� !!! ......������?����?
	@RequestMapping(value = "/st_accountPurchase",method = RequestMethod.POST)
=======
//	지점 매입 조회(GET)
	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.GET)
	public String st_accountPurchaseList() {
		return "accounting/store_account_purchase";
	}
//	지점 매입 조회(POST)
	@RequestMapping(value = "/st_accountPurchaseList",method = RequestMethod.POST)
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
	@ResponseBody
	public List<Account> st_accountPurchaseList(@RequestBody StoreItemHistory sih) {
<<<<<<< HEAD
		//System.out.println(accountDate1+" ~ "+accountDate2);
=======
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
		return accountService.getPurchaseSaleList(sih);
	}
	

	
	
<<<<<<< HEAD
//	���� ������Ȳ
=======
//	���� ������Ȳ
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
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
