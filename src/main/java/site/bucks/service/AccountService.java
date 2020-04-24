package site.bucks.service;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;

public interface AccountService {
	
	//��������, ������� ���Ǻ� ��� 
	List<Account> getPurchaseSaleList(StoreItemHistory sih);
	
	

}
