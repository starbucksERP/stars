package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.AccountPS;

public interface AccountMapper {
	
	//��������, ������� ���Ǻ� ��� 
	List<AccountPS> selectPurchaseSale (AccountPS account); 

}
