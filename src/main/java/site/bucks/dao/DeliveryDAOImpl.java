package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Delivery;
import site.bucks.dto.OrderItem;
import site.bucks.mapper.DeliveryMapper;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int updateDeliveryReceiptProcess(OrderItem orderItem) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReceiptProcess(orderItem);
	}

	@Override
	public int insertDeliveryRequest(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).insertDeliveryRequest(delivery);
	}

	@Override
	public List<Delivery> selectDeliveryList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).selectDeliveryList(delivery);
	}

	/*
	 * @Override public int updateDeliveryState(int deliverySeq) { return
	 * sqlSession.getMapper(DeliveryMapper.class).updateDeliveryState(deliverySeq);
	 * }
	 */

	@Override
	public int updateDeliveryReq(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReq(deliverySeq);
	}

	@Override
	public int updateDeliveryReady(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReady(deliverySeq);
	}


	
}
