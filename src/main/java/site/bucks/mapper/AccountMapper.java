package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Account;

public interface AccountMapper {
	
	//지점매입, 본사매출 조건별 출력 
	List<Account> selectPurchaseSaleList (Account account); 

}
