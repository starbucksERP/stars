package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Purchase;
import site.bucks.mapper.PurchaseMapper;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertPurchaseRequest(Purchase purchase) {
		return sqlSession.getMapper(PurchaseMapper.class).insertPurchaseRequest(purchase);
	}

	@Override
	public List<Purchase> displayPurchaseList(Purchase purchase) {
		return sqlSession.getMapper(PurchaseMapper.class).displayPurchaseList(purchase);
	}

	@Override
	public int updatePurchaseState(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).updatePurchaseState(purchaseSeq);
	}

}
