package site.bucks.dao;

import java.util.List;

import site.bucks.dto.AccountPS;

public interface AccountDAO {

	//��������, ������� ���Ǻ� ��� 
	List<AccountPS> selectPurchaseSale (AccountPS account); 

}
