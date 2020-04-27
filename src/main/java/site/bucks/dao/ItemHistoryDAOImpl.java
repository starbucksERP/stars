package site.bucks.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Purchase;
import site.bucks.mapper.ItemHistoryMapper;

@Repository
public class ItemHistoryDAOImpl implements ItemHistoryDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int newPOItemHist(Purchase purchase) {
		return sqlSession.getMapper(ItemHistoryMapper.class).newPOItemHist(purchase); 
	}

	@Override
	public int updatedPOItemHist(int purchaseSeq) {
		return sqlSession.getMapper(ItemHistoryMapper.class).updatedPOItemHist(purchaseSeq); 
	}
	
	
}