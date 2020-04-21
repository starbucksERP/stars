package site.bucks.service;

import java.util.List;

import site.bucks.dto.Item;

public interface ItemService {
	void insertProduct(Item item);
	void updateItem(Item item);
	void updateItemMinQty(Item item);
	Item selectItemList(Item item);
	Item selectItemPlanList(Item item);
	void selectItemQty(String itemNum);
	List<String> selectItemVendorList(String itemVendor);
}
