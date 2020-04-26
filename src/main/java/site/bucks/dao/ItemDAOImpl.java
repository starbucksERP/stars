package site.bucks.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Item;
import site.bucks.mapper.ItemMapper;

@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertProduct(Item item) {
		return sqlSession.getMapper(ItemMapper.class).insertProduct(item);
	}

	@Override
	public int updateProduct(Item item) {
		return sqlSession.getMapper(ItemMapper.class).updateProduct(item);
	}

	@Override
	public int deleteProduct(Map<String, Object> itemNumMap) {
		return sqlSession.getMapper(ItemMapper.class).deleteProduct(itemNumMap);
	}

	@Override
	public Item selectItem(String itemNum) {
		return sqlSession.getMapper(ItemMapper.class).selectItem(itemNum);
	}

	@Override
	public List<Item> selectProductList(Item item) {
		return sqlSession.getMapper(ItemMapper.class).selectProductList(item);
	}

	@Override
	public List<Item> selectItemList(Item item) {
		return sqlSession.getMapper(ItemMapper.class).selectItemList(item);
	}

	@Override
	public int updateItemMinQty(Item item) {
		return sqlSession.getMapper(ItemMapper.class).updateItemMinQty(item);
	}

	@Override
	public List<Item> selectItemPlanList(Item item) {
		return sqlSession.getMapper(ItemMapper.class).selectItemPlanList(item);
	}

	@Override
	public int selectItemQty(String itemNum) {
		return sqlSession.getMapper(ItemMapper.class).selectItemQty(itemNum);
	}

	@Override
	public List<String> selectItemVendorList(String itemVendor) {
		return sqlSession.getMapper(ItemMapper.class).selectItemVendorList(itemVendor);
	}

	@Override
	public int updateTotalQty(Double change) {
		return sqlSession.getMapper(ItemMapper.class).updateTotalQty(change);
	}

	@Override
	public int deleteItem(Map<String, Object> itemNumMap) {
		return sqlSession.getMapper(ItemMapper.class).deleteItem(itemNumMap);
	}


	

}
