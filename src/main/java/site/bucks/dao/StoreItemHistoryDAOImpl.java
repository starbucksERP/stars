package site.bucks.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.OrderItem;
import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.StoreItemHistoryMapper;

@Repository
public class StoreItemHistoryDAOImpl implements StoreItemHistoryDAO{

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<StoreItemHistory> selectReciptList() {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).selectReciptList();
	}
	
	@Override
	public List<StoreItemHistory> selectReciptConditionList(AppliedOrderSta orderSta) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).selectReciptConditionList(orderSta);
	}

	@Override
	public int updateReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateReceiptProcess(sih);
	}

	@Override
	public int updateCancelProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateCancelProcess(sih);
	}

	@Override
	public int insertSIH(OrderItem orderItem) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).insertSIH(orderItem);
	}

	@Override
	public StoreItemHistory selectState10(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).selectState10(sih);
	}

	@Override
	public int updateStoreItemHistory(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateStoreItemHistory(sih);
	}

	

	

	

}
