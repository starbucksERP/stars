package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItemHistory;

public interface StoreItemDAO {
	ProductRecipe selectProduct(String product);
	int insertSale(Sale sale);
	int selectItemRest(String item);
	int updateRecord(Map<String, Object> map);
	int updateStoreItem(Map<String, Object> map);
	
	int updateStoreItemReceiptProcess(StoreItemHistory sih);
	
	List<Sale> selectSaleList();
}
