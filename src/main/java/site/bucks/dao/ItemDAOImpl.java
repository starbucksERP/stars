package site.bucks.dao;

import java.util.List;

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
	public int updateItem(Item item) {
		return sqlSession.getMapper(ItemMapper.class).updateItem(item);
	}

	@Override
	public int updateItemMinQty(Item item) {
		return sqlSession.getMapper(ItemMapper.class).updateItemMinQty(item);
	}
	
	@Override
	public int deleteProduct(String itemNum) {
		return sqlSession.getMapper(ItemMapper.class).deleteProduct(itemNum);
	}

	@Override
	public Item selectItem(String itemNum) {
		return sqlSession.getMapper(ItemMapper.class).selectItem(itemNum);
	}

	@Override
	public List<Item> selectItemList(Item item) {
		return sqlSession.getMapper(ItemMapper.class).selectItemList(item);
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

<<<<<<< HEAD
	@Override
	public int updateTotalQty(Double change) {
		return sqlSession.getMapper(ItemMapper.class).updateTotalQty(change);
	}


=======
>>>>>>> branch 'master' of https://github.com/starbucksERP/stars.git

}
