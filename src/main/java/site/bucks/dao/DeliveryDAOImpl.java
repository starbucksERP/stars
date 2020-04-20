package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Delivery;
import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.DeliveryMapper;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int updateDeliveryReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReceiptProcess(sih);
	}

	@Override
	public int insertDeliveryRequest(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).insertDeliveryRequest(delivery);
	}

	@Override
	public List<Delivery> selectDeliveryList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).selectDeliveryList(delivery);
	}

	@Override
	public int updateDeliveryState(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryState(deliverySeq);
	}


	
}
