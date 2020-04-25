package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.OrderItem;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.mapper.StoreItemMapper;

@Repository
public class StoreItemDAOImpl implements StoreItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ProductRecipe selectProduct(String saleProduct) {
		return sqlSession.getMapper(StoreItemMapper.class).selectProduct(saleProduct);
	}
	
	
	@Override
	public int insertSale(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).insertSale(sale);
	}
	
	
	@Override
	public int updateStoreItemRecord(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItemRecord(sale);
	}

	@Override
	public int updateStoreItemBack(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItemBack(sale);
	}
	
	@Override
	public int deleteSale(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).deleteSale(sale);
	}
	

	@Override
	public int updateStoreItemReceiptProcess(OrderItem orderItem) {
		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItemReceiptProcess(orderItem);
	}

	@Override
	public List<Sale> selectSaleList(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).selectSaleList(sale);
	}

	

	

	

	




	
	


	
}
