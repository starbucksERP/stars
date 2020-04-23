package site.bucks.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.AccountDAO;
import site.bucks.dto.Account;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO accountDAO;

	@Override
	public List<Account> getPurchaseSaleList(Account account) {
		return accountDAO.selectPurchaseSaleList(account);
	}


}
