package site.bucks.dao;

import java.util.List;
import java.util.Map;

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
	public int insertPurchaseOrder(Purchase purchase) {
		return sqlSession.getMapper(PurchaseMapper.class).insertPurchaseOrder(purchase);
	}
	
	@Override
	public List<Purchase> searchPurchaseList(Purchase purchase) {
		return sqlSession.getMapper(PurchaseMapper.class).searchPurchaseList(purchase);
	}

	@Override
	public int purchaseReqConfirm(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseReqConfirm(purchaseSeq);
	}
	
	@Override
	public int purchaseComplete(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseComplete(purchaseSeq);
	}
	
	@Override
	public int purchaseCompleteHQ(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseCompleteHQ(purchaseSeq);
	}
	
	@Override
	public int purchaseCancel(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseCancel(purchaseSeq);
	}

	@Override
	public int updateQtyFromPurchase(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).updateQtyFromPurchase(purchaseSeq);
	}

	
	
	
	

}
