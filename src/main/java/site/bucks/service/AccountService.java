package site.bucks.service;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

public interface AccountService {
	
//	지점매입
	List<Account> getPurchaseSaleList(StoreItemHistory sih);
	
//	지점매출 
	List<Account> getStSaleList(Sale s);
	
//	본사 매입 
	List<Account> getMainPurchaseList(Purchase p);
	
//	본사 매출
	List<Account> getMainSaleList (StoreItemHistory sih);
	
//	본사 손익분석
//	Map<String, Object> getAccountIncome();

}
