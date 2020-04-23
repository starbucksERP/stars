package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;

public interface AccountMapper {
	
	//��������, ������� ���Ǻ� ��� 
	List<Account> selectPurchaseSaleList (StoreItemHistory sih); 

}
