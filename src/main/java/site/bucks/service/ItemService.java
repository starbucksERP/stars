package site.bucks.service;

import java.util.List;

import site.bucks.dto.Item;

public interface ItemService {
	void addProduct(Item item);
	void modifyItem(Item item);
	void modifyItemMinQty(Item item);
	void removeProduct(String itemNum);
	Item getItem (String itemNum);
	List<Item> getItemList(Item item);
	List<Item> getItemPlanList(Item item);
	void getItemQty(String itemNum);
	List<String> getItemVendorList(String itemVendor);
	void modifyTotalQty(Double change);
}
