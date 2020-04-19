package site.bucks.service;

import java.util.List;

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
	public void modifyItem(Item item) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyItemMinQty(Item item) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeProduct(String itemNum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Item getItem(String itemNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getItemList(Item item) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Item> getItemPlanList(Item item) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getItemQty(String itemNum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getItemVendorList(String itemVendor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyTotalQty(Double change) {
		// TODO Auto-generated method stub
		
	}

}
