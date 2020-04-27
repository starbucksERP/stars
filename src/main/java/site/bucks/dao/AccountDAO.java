package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.Item;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

public interface AccountDAO {
	
//	��������
	List<Account> selectStSaleList(Sale s);	
	
//	��������
	List<Account> selectPurchaseSaleList (StoreItemHistory sih); 

//	���� ����
	List<Account> selectMainSaleList (StoreItemHistory sih);
	
//	���� ���� 
	List<Account> selectMainPurchaseList(Purchase p);
	
	
//	���� ���ͺм�
//	List<Account> selectAccountIncome(int itemState);
	
}
