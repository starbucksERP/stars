package site.bucks.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.DeliveryMapper;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int updateDeliveryReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(DeliveryMapper.class).updateDeliveryReceiptProcess(sih);
	}
	
	
}
