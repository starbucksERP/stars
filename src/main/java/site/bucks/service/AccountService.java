package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Account;

public interface AccountService {
	
	//��������, ������� ���Ǻ� ��� 
	List<Account> getPurchaseSaleList(Account account);
	
	

}
