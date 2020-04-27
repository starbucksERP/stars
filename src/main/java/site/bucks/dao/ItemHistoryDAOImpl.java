package site.bucks.dao;

<<<<<<< HEAD
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.ItemHistory;
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
	
	
=======
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.ItemHistory;
import site.bucks.mapper.ItemHistoryMapper;
@Repository
public class ItemHistoryDAOImpl implements ItemHistoryDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertItemHistory(ItemHistory itemHistory) {
		return sqlSession.getMapper(ItemHistoryMapper.class).insertItemHistory(itemHistory);
	}

	@Override
	public List<ItemHistory> selectItemHistoryist(ItemHistory itemHistory) {
		return sqlSession.getMapper(ItemHistoryMapper.class).selectItemHistoryist(itemHistory);
	}

>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git
}
