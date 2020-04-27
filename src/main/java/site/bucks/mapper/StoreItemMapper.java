package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.OrderItem;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;

public interface StoreItemMapper {
	List<ProductRecipe> selectCategory(String category);
	ProductRecipe selectProduct(String saleProduct);
	ProductRecipe selectProductName(String category);
	int insertSale(Sale sale);
	int updateStoreItemRecord(Sale sale);
	int updateStoreItemBack(Sale sale);
	int deleteSale(Sale sale);
	
	
	
	int updateStoreItemReceiptProcess(OrderItem orderItem);
	StoreItem selectExistStoreItem(OrderItem orderItem);
	int insertStoreItemReceiptProcess(OrderItem orderItem);
	
	List<Sale> selectSaleList(Sale sale);
	
	
	List<StoreItem> selectStoreItemList(StoreItem storeItem);
	StoreItem selectStoreItem(StoreItem storeItem);
	int deleteStoreItem(StoreItem storeItem);
	int updateStoreItem(StoreItem storeItem);
}
