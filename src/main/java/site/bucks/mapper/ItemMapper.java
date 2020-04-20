package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Item;

public interface ItemMapper {
	int insertItem(Item item);
	int updateItemMinQty(Item item);
	Item selectItemList(Item item);
	Item selectItemPlanList(Item item);
	int selectItemQty(String itemNum);
	List<String> selectItemVendorList(String itemVendor);
	
}
