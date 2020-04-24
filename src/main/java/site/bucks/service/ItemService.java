package site.bucks.service;

import java.util.List;
import java.util.Map;

import site.bucks.dto.Item;

public interface ItemService {
	void addProduct(Item item);
	void modifyProduct(Item item);
	void removeProduct(Map<String, Object> itemNumMap);
	void removeItem(Map<String, Object> itemNumMap);
	Item getItem (String itemNum);
	List<Item> getProductList(Item item);
	List<Item> getItemList(Item item);
	void modifyItemMinQty(Item item);
	List<Item> getItemPlanList(Item item);
	void getItemQty(String itemNum);
	List<String> getItemVendorList(String itemVendor);
	void modifyTotalQty(Double change);
}
