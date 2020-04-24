package site.bucks.dao;

import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;

public interface StoreItemDAO {
	ProductRecipe selectProduct(String saleProduct);
	int insertSale(Sale sale);
	int updateStoreItemRecord(Sale sale);
	int updateStoreItemBack(Sale sale);
	int deleteSale(Sale sale);
	
	int updateStoreItemReceiptProcess(OrderItem orderItem);
	
	List<Sale> selectSaleList(Sale sale);
}
