package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int updateReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateReceiptProcess(sih);
	}

	@Override
	public int updateCancelProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateCancelProcess(sih);
	}

	@Override
	public int insertStoreItemHistory(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).insertStoreItemHistory(sih);
	}

	@Override
	public StoreItemHistory selectReciptRequest(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).selectReciptRequest(sih);
	}

	@Override
	public int updateStoreItemHistory(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateStoreItemHistory(sih);
	}
	

}
