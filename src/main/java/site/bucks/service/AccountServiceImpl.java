package site.bucks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.AccountDAO;
import site.bucks.dto.Account;
import site.bucks.dto.Item;
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
//		sih.setItemState(33);
//		sih.setItemState(70);
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



	

	/*
	 * @Override public List<Account> getMainPurchaseList(Item item) { return
	 * accountDAO.mainPurchaseList(item); }
	 * 
	 * @Override public Map<String, Object> getAccountIncome() { Map<String, Object>
	 * returnMap = new HashMap<String, Object>(); // 매입에대한 손익분석
	 * returnMap.put("mainPurchase", accountDAO.selectAccountIncome(33)); // 매출에대한
	 * 손익분석 returnMap.put("mainSell", accountDAO.selectAccountIncome(70)); return
	 * returnMap; }
	 * 
	 */

}
