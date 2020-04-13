package site.bucks.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.OrderItemMapper;

@Repository
public class OrderItemDAOImpl implements OrderItemDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int orderReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(OrderItemMapper.class).orderReceiptProcess(sih);
	}
	

}
