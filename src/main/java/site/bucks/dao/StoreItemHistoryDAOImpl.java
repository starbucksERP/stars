package site.bucks.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;
import site.bucks.mapper.StoreItemHistoryMapper;

@Repository
public class StoreItemHistoryDAOImpl implements StoreItemHistoryDAO{

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertSIH(OrderItem orderItem) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).insertSIH(orderItem);
	}

	@Override
	public List<String> searchItems(Item item) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).searchItems(item);
	}

	@Override
	public Item searchItem(String itemName) {
		return sqlSession.getMapper(StoreItemHistoryMapper.class).searchItem(itemName);
	}


	





	

	

	

}
