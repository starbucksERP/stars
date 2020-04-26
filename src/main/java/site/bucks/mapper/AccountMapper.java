package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.Item;
import site.bucks.dto.ItemHistory;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

public interface AccountMapper {
	
//	지점매입
	List<Account> selectPurchaseSaleList (StoreItemHistory sih); 
	
//	지점매출
	List<Account> selectStSaleList(Sale s);
	
//	본사매입 
	List<Account> selectMainPurchaseList(Purchase p);
	
//	본사매출 
	List<Account> selectMainSaleList (StoreItemHistory sih);
	
//	본사 손익분석
	List<Account> selectAccountIncome(int itemState);

}
