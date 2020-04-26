package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Account;
import site.bucks.dto.Purchase;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.AccountMapper;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Account> selectStSaleList(Sale s) {
		return sqlSession.getMapper(AccountMapper.class).selectStSaleList(s);
	}
	@Override
	public List<Account> selectPurchaseSaleList(StoreItemHistory sih) {
		return sqlSession.getMapper(AccountMapper.class).selectPurchaseSaleList(sih);
	}

	@Override
	public List<Account> selectMainSaleList(StoreItemHistory sih) {
		return sqlSession.getMapper(AccountMapper.class).selectMainSaleList(sih);
	}

	@Override
	public List<Account> selectMainPurchaseList(Purchase p) {
		return sqlSession.getMapper(AccountMapper.class).selectMainPurchaseList(p);
	}



	
	

	
	/*

	 
	 @Override public List<Account> selectAccountIncome(int itemState) { 
	 return sqlSession.getMapper(AccountMapper.class).selectAccountIncome(itemState); 
	 }
	 
	*/
	
	

}
