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
	public int purchaseReqConfirm(String requestNum) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseReqConfirm(requestNum);
	}
	
	@Override
	public int purchaseComplete(String requestNum) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseComplete(requestNum);
	}
	
	@Override
	public int purchaseCompleteHQ(String requestNum) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseCompleteHQ(requestNum);
	}
	
	@Override
	public int purchaseCancel(String requestNum) {
		return sqlSession.getMapper(PurchaseMapper.class).purchaseCancel(requestNum);
	}

	@Override
	public int updateQtyFromPurchase(int purchaseSeq) {
		return sqlSession.getMapper(PurchaseMapper.class).updateQtyFromPurchase(purchaseSeq);
	}

	@Override
	public int insertDeliveryFromPurchase(String requestNum) {
		return sqlSession.getMapper(PurchaseMapper.class).insertDeliveryFromPurchase(requestNum);
	
	}

	
	
	
	

}
