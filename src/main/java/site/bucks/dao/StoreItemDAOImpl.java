package site.bucks.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.SaleItem;
import site.bucks.dto.StoreItem;
import site.bucks.dto.StoreItemHistory;
import site.bucks.mapper.StoreItemMapper;

@Repository
public class StoreItemDAOImpl implements StoreItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ProductRecipe selectProduct(String product) {
		return sqlSession.getMapper(StoreItemMapper.class).selectProduct(product);
	}
	
	@Override
	public StoreItem selectStoreItemPrice(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).selectStoreItemPrice(sale);
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
	public int updateStoreItemReceiptProcess(StoreItemHistory sih) {
		return sqlSession.getMapper(StoreItemMapper.class).updateStoreItemReceiptProcess(sih);
	}

	@Override
	public List<SaleItem> selectSaleList(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).selectSaleList(sale);
	}

	@Override
	public List<String> selectSaleProductName1(Sale sale) {
		return sqlSession.getMapper(StoreItemMapper.class).selectSaleProductName1(sale);
	}

	@Override
	public List<String> selectSaleProductName2() {
		return sqlSession.getMapper(StoreItemMapper.class).selectSaleProductName2();
	}

	

	

	

	




	
	


	
}
