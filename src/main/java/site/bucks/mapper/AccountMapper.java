package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Account;

public interface AccountMapper {
	
	//��������, ������� ���Ǻ� ��� 
	List<Account> selectPurchaseSaleList (Account account); 

}
