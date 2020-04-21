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
	public Item selectItemList(Item item) {
		return sqlSession.getMapper(ItemMapper.class).selectItemList(item);
	}

	@Override
	public Item selectItemPlanList(Item item) {
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


}
