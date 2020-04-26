package site.bucks.dao;

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

}
