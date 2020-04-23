package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import site.bucks.dto.AccountPS;
import site.bucks.mapper.AccountMapper;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	private SqlSession sqlsession;

	//��������, ������� ���Ǻ� ��� 
	@Override
	public List<AccountPS> selectPurchaseSale(AccountPS account) {
		return sqlsession.getMapper(AccountMapper.class).selectPurchaseSale(account);
	}

}
