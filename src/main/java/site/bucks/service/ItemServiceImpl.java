package site.bucks.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.ItemDAO;
import site.bucks.dto.Item;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDAO itemDAO;

	@Override
	public void addProduct(Item item) {
		itemDAO.insertProduct(item);
	}

	@Override
	public void modifyProduct(Item item) {
		itemDAO.updateProduct(item);
	}

	@Override
	public void removeProduct(Map<String, Object> itemNumMap) {
		itemDAO.deleteProduct(itemNumMap);
	}

	@Override
	public Item getItem(String itemNum) {
		return itemDAO.selectItem(itemNum);
	}

	@Override
	public List<Item> getProductList(Item item) {
		return itemDAO.selectProductList(item);
	}

	@Override
	public List<Item> getItemList(Item item) {
		return itemDAO.selectItemList(item);
	}

	@Override
	public void modifyItemMinQty(Map<String, Object> itemNumMap) {
		itemDAO.updateItemMinQty(itemNumMap);
	}

	@Override
	public List<Item> getItemPlanList(Item item) {
		return itemDAO.selectItemPlanList(item);
	}

	@Override
	public void getItemQty(String itemNum) {
		itemDAO.selectItemQty(itemNum);
	}

	@Override
	public List<String> getItemVendorList(String itemVendor) {
		return itemDAO.selectItemVendorList(itemVendor);
	}

	@Override
	public void modifyTotalQty(Double change) {
		itemDAO.updateTotalQty(change);
	}

	@Override
	public void removeItem(Map<String, Object> itemNumMap) {
		itemDAO.deleteItem(itemNumMap);
		
	}
	

}
