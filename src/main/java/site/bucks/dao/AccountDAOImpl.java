package site.bucks.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Account;
import site.bucks.mapper.AccountMapper;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Account> selectPurchaseSaleList(Account account) {
		return sqlSession.getMapper(AccountMapper.class).selectPurchaseSaleList(account);
	}
	

}
