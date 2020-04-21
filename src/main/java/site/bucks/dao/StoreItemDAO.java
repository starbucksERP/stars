package site.bucks.dao;

import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.SaleItem;
import site.bucks.dto.StoreItem;

public interface StoreItemDAO {
	ProductRecipe selectProduct(String product);
	StoreItem selectStoreItemPrice(Sale sale);
	int insertSale(Sale sale);
	int updateStoreItemRecord(Sale sale);
	int updateStoreItemBack(Sale sale);
	int deleteSale(Sale sale);
	
	int updateStoreItemReceiptProcess(OrderItem orderItem);
	
	List<SaleItem> selectSaleList(Sale sale);
	
	List<String> selectSaleProductName1(Sale sale);
	List<String> selectSaleProductName2(Sale sale);
}
