package site.bucks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.AccountDAO;
import site.bucks.dto.Account;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO accountDAO;

	@Override
	public List<Account> getStSaleList(Sale s) {
		return accountDAO.selectStSaleList(s);
	}
	
	@Override
	public List<Account> getPurchaseSaleList(StoreItemHistory sih) {
		return accountDAO.selectPurchaseSaleList(sih);
	}

	@Override
	public List<Account> getMainPurchaseList(Purchase p) {
		return accountDAO.selectMainPurchaseList(p);
	}

	@Override
	public List<Account> getMainSaleList(StoreItemHistory sih) {
		return accountDAO.selectMainSaleList(sih);
	}


}
