package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;

public interface AccountService {
	
	//��������, ������� ���Ǻ� ��� 
	List<Account> getPurchaseSaleList(StoreItemHistory sih);
	
	

}
