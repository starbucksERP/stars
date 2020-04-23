package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Account;

public interface AccountService {
	
	//지점매입, 본사매출 조건별 출력 
	List<Account> getPurchaseSaleList(Account account);
	
	

}
