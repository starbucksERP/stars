package site.bucks.dao;


import java.util.List;


import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;
import site.bucks.dto.OrderNum;
import site.bucks.dto.Store;

public interface StoreItemHistoryDAO {
	List<OrderNum> numQty();
	int numQtyPlus(OrderItem orderItem);
	int numQtyInit();
	int orerNumInsertStore(Store store);
	
	int insertSIH(OrderItem orderItem);
	List<String> searchItems(Item item);
	Item searchItem(String itemName);
	int updateCancelStoreOrder(OrderItem orderItem);
}
