package site.bucks.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import site.bucks.dao.ItemHistoryDAO;
import site.bucks.dto.ItemHistory;

public class ItemHistoryImpl implements ItemHistoryDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertItemHistory(ItemHistory itemHistory) {
		return sqlSession.getMapper(ItemHistoryMapper.class).insertItemHistory(itemHistory);
	}

	@Override
	public List<ItemHistory> recentHistoryList() {
		return sqlSession.getMapper(ItemHistoryMapper.class).recentHistoryList();
	}

	@Override
	public List<ItemHistory> selectItemHistoryList(ItemHistory itemHistory) {
		return sqlSession.getMapper(ItemHistoryMapper.class).selectItemHistoryList(itemHistory);
	}

	@Override
	public List<ItemHistory> allHistoryTap() {
		return sqlSession.getMapper(ItemHistoryMapper.class).allHistoryTap();
	}

	@Override
	public List<ItemHistory> goodsReceivedHistoryTap() {
		return sqlSession.getMapper(ItemHistoryMapper.class).goodsReceivedHistoryTap();
	}

	@Override
	public List<ItemHistory> goodsShippedHistoryTap() {
		return sqlSession.getMapper(ItemHistoryMapper.class).goodsShippedHistoryTap();
	}

	@Override
	public List<ItemHistory> requestConfirmedHistoryTap() {
		return sqlSession.getMapper(ItemHistoryMapper.class).requestConfirmedHistoryTap();
	}

}
