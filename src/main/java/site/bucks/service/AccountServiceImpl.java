package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.AccountDAO;
import site.bucks.dto.AccountPS;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO accountDAO;

	@Override
	public List<AccountPS> getPurchaseSale(AccountPS account) {
		
//		지점별 출력 다르게하기
		account.getSih().setStoreId(1021);
		return accountDAO.selectPurchaseSale(account);
	}

}
