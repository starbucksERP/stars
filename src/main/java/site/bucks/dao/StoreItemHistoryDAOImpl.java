package site.bucks.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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





	

	

	

}
