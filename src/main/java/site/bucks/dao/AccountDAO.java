package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;

public interface AccountDAO {

	//지점매입, 본사매출 조건별 출력 
	List<Account> selectPurchaseSaleList (StoreItemHistory sih); 

}
