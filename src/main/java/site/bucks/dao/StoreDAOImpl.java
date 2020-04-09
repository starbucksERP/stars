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

	@Override
	public int closeStore(int storeCode) {
		return sqlSession.getMapper(StoreMapper.class).closeStore(storeCode);
	}

	@Override
	public int updateStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).updateStore(store);
	}

	@Override
	public List<Store> selectAllStore(Store store) {
		return sqlSession.getMapper(StoreMapper.class).selectAllStore(store);
	}


}
