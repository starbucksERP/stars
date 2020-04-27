package site.bucks.service;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

public interface AccountService {
	
//	��������
	List<Account> getPurchaseSaleList(StoreItemHistory sih);
	
//	�������� 
	List<Account> getStSaleList(Sale s);
	
//	���� ���� 
	List<Account> getMainPurchaseList(Purchase p);
	
//	���� ����
	List<Account> getMainSaleList (StoreItemHistory sih);
	
//	���� ���ͺм�
//	Map<String, Object> getAccountIncome();

}
