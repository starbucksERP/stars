package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Store;
import site.bucks.mapper.StoreMapper;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).insertStore(store);
	}
/*
	@Override
	public int closeStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).closeStore(store);
	}
*/	

	@Override
	public int updateStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).updateStore(store);
	}

	@Override
	public Store selectstoreId(int storeId) {
		return sqlSession.getMapper(StoreMapper.class).selectstoreId(storeId);
	}

	@Override
	public Store selectStoreName(String storeName) {
		return sqlSession.getMapper(StoreMapper.class).selectStoreName(storeName);
	}
	
	@Override
	public List<Store> selectAllStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).selectAllStore(store);
	}




}
