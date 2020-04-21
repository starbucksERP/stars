package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Item;

public interface ItemMapper {
	int insertProduct(Item item);
	int updateItem(Item item);
	int updateItemMinQty(Item item);
	int deleteProduct(String itemNum);
	Item selectItem (String itemNum);
	List<Item> selectItemList(Item item);
	List<Item> selectItemPlanList(Item item);
	int selectItemQty(String itemNum);
	List<String> selectItemVendorList(String itemVendor);
	int updateTotalQty(Double change);
}
