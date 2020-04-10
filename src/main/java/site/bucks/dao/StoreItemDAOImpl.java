package site.bucks.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.mapper.StoreItemMapper;

@Repository
public class StoreItemDAOImpl implements StoreItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int updateRecord(Map<String, Object> map) {
		return sqlSession.getMapper(StoreItemMapper.class).updateRecord(map);
	}

	@Override
	public int selectItemRest(String item) {
		return sqlSession.getMapper(StoreItemMapper.class).selectItemRest(item);
	}

	@Override
	public int insertSale(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).insertSale(sale);
	}

	@Override
	public List<Sale> selectSaleList() {
		return sqlSession.getMapper(StoreItemMapper.class).selectSaleList();
	}

//	@Override
//	public String selectCategory(Sale sale) {
//		return sqlSession.getMapper(StoreItemMapper.class).selectCategory(sale);
//	}
	
	@Override
	public ProductRecipe selectProduct(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).selectProduct(sale);
	}

//	@Override
//	public int updateStoreItem1(Map<String, Object> map) {
//		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItem1(map);
//	}
//
//	@Override
//	public int updateStoreItem2(Map<String, Object> map) {
//		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItem2(map);
//	}

	
}
