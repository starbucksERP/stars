package site.bucks.mapper;

import java.util.List;

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;

public interface StoreItemMapper {
	ProductRecipe selectProduct(String saleProduct);
	StoreItem selectStoreItemPrice(Sale sale);
	int insertSale(Sale sale);
	int updateStoreItemRecord(Sale sale);
	int updateStoreItemBack(Sale sale);
	int deleteSale(Sale sale);
	
	int updateStoreItemReceiptProcess(OrderItem orderItem);
	
	List<Sale> selectSaleList(Sale sale);
	
	List<String> selectSaleProductName1(Sale sale);
	List<String> selectSaleProductName2(Sale sale);
	
	Item searchProduct1(String saleProduct);
	ProductRecipe searchProduct2(String saleProduct);
}
