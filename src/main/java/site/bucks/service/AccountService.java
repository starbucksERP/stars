package site.bucks.service;

import java.util.List;

import site.bucks.dto.AccountPS;

public interface AccountService {
	
	//��������, ������� ���Ǻ� ��� 
	List<AccountPS> getPurchaseSale(AccountPS account);
	
	

}
