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
		
//		������ ��� �ٸ����ϱ�
		account.getSih().setStoreId(1021);
		return accountDAO.selectPurchaseSale(account);
	}

}
