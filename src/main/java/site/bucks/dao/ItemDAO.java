package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;

public interface ItemDAO {
	int insertProduct(Item item);
	int updateProduct(Item item);
	int deleteProduct(Map<String, Object> itemNumMap);
	int deleteItem(Map<String, Object> itemNumMap);
	Item selectItem (String itemNum);
	List<Item> selectProductList(Item item);
	List<Item> selectItemList(Item item);
	int updateItemMinQty(Item item);
	List<Item> selectItemPlanList(Item item);
	int selectItemQty(String itemNum);
	List<String> selectItemVendorList(String itemVendor);
	int updateTotalQty(Double change);
	
	
}
