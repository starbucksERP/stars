package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Account;

public interface AccountDAO {

	//��������, ������� ���Ǻ� ��� 
	List<Account> selectPurchaseSaleList (Account account); 

}
