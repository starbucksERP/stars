package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;

public interface AccountDAO {

	//��������, ������� ���Ǻ� ��� 
	List<Account> selectPurchaseSaleList (StoreItemHistory sih); 

}
