package site.bucks.dao;

import java.util.List;
import java.util.Map;

import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;

public interface StoreItemDAO {
	int updateRecord(Map<String, Object> map);
	int selectItemRest(String item);
	int insertSale(Sale sale);
	List<Sale> selectSaleList();
	ProductRecipe selectProduct(Sale sale);
}
