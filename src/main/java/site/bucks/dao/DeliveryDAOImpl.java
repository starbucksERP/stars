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
	public List<Delivery> searchDelReqList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).searchDelReqList(delivery);
	}
	
	@Override
	public List<Delivery> searchDelReadyList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).searchDelReadyList(delivery);
	}

	@Override
	public int updateDeliveryReq(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReq(deliverySeq);
	}

	@Override
	public int updateDeliveryReady(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReady(deliverySeq);
	}

	@Override
	public List<Delivery> displayDelReqList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).displayDelReqList(delivery);
	}

	@Override
	public List<Delivery> displayDelReadyList(Delivery delivery) {
		return sqlSession.getMapper(DeliveryMapper.class).displayDelReadyList(delivery);
	}

	@Override
	public int updateQtyFromDelivery(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).updateQtyFromDelivery(deliverySeq);
	
	}

	@Override
	public int insertDelReqConfimIH(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).insertDelReqConfimIH(deliverySeq);
		
	}

	@Override
	public int insertDelReadyIH(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).insertDelReadyIH(deliverySeq);
		
	}

	@Override
	public int insertSihFromDelInProcess(int deliverySeq) {
		return sqlSession.getMapper(DeliveryMapper.class).insertSihFromDelInProcess(deliverySeq);
	}



	
}
