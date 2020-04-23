package site.bucks.service;

import java.util.List;

import site.bucks.dto.AccountPS;

public interface AccountService {
	
	//지점매입, 본사매출 조건별 출력 
	List<AccountPS> getPurchaseSale(AccountPS account);
	
	

}
