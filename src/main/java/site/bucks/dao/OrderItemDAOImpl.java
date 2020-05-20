package site.bucks.dao;



import java.util.List;
import java.util.Map;

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
	public List<OrderItem> selectStoreOrderItems(String requestNum, String storeId) {
		return sqlSession.getMapper(OrderItemMapper.class).selectOrderItems(requestNum);
	}

	@Override
	public int updateOrderCheck(OrderItem orderItem) {
		return sqlSession.getMapper(OrderItemMapper.class).updateOrderCheck(orderItem);
	}

	
	
	
	@Override
	public int updateOrderItemState(Map<String, Object> numAndStateMap) {
		return sqlSession.getMapper(OrderItemMapper.class).updateOrderItemState(numAndStateMap);
	}

	@Override
	public List<OrderItem> selectOrderItemList(OrderItem orerItem) {
		return sqlSession.getMapper(OrderItemMapper.class).selectOrderItemList(orerItem);
	}

	@Override
	public List<OrderItem> selectOrderItems(String requestNum) {
		return sqlSession.getMapper(OrderItemMapper.class).selectOrderItems(requestNum);
	}

	
	//근형
	@Override
	public int updateOrderStateFromPurchase(String requestNum) {
		return  sqlSession.getMapper(OrderItemMapper.class).updateOrderStateFromPurchase(requestNum);
	}

	@Override
	public int updateOrderStateFromDelivery(int deliverySeq) {
		return  sqlSession.getMapper(OrderItemMapper.class).updateOrderStateFromDelivery(deliverySeq);
	}

	














	



	
	

}
