package site.bucks.dao;

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
	public int updateReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).updateReceiptProcess(sih);
	}

}
