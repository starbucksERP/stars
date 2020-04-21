package site.bucks.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.OrderItem;
import site.bucks.mapper.OrderItemMapper;

@Repository
public class OrderItemDAOImpl implements OrderItemDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertStoreOrder(OrderItem orderItem) {
		return sqlSession.getMapper(OrderItemMapper.class).insertStoreOrder(orderItem);
	}

	@Override
	public List<OrderItem> selectStoreOrderItemList(OrderItem orderItem) {
		return  sqlSession.getMapper(OrderItemMapper.class).selectStoreOrderItemList(orderItem);
	}

	@Override
	public int updateOrderReceiptProcess(OrderItem orderItem) {
		return sqlSession.getMapper(OrderItemMapper.class).updateOrderReceiptProcess(orderItem);
	}

	@Override
	public int updateOrderItem(OrderItem orderItem) {
		return sqlSession.getMapper(OrderItemMapper.class).updateOrderItem(orderItem);
	}

	@Override
	public List<OrderItem> selectOrderItemList(OrderItem orerItem) {
		return sqlSession.getMapper(OrderItemMapper.class).selectOrderItemList(orerItem);
	}

	@Override
	public List<OrderItem> selectOrderItems(String requestNum) {
		return sqlSession.getMapper(OrderItemMapper.class).selectOrderItems(requestNum);
	}



	



	
	

}
