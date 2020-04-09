package site.bucks.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.StoreItemDAO;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;

@Service
public class StoreItemServiceImpl implements StoreItemService{
	
	@Autowired
	private StoreItemDAO storeItemDAO;
	
//	@Autowired
//	HashMap<String, String> map;
	
//	재료로 받을때 조합
	@Override
	public void saleRecord1(Sale sale) {
		
		storeItemDAO.insertSale(sale);
		
		ProductRecipe pr=storeItemDAO.selectProduct(sale);
		
		String item1=pr.getItem1();
		String item2=pr.getItem2();
		String item3=pr.getItem3();
		
		int qty = sale.getSaleQty();
		
		calculator1(qty,item1);
		
		if(item2!=null) {
			calculator1(qty, item2);
		}
		if(item3!=null) {
			calculator1(qty, item3);
		}
		
	}

	public void calculator1(int qty, String item) {
//		여기서 추가합 맵은 updateRecord 및 updateItem 두개의 메소드에 사용
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("item", item);
		int itemRest= storeItemDAO.selectItemRest(item);
		
//		남은 재고에 상품재고 합
		itemRest=itemRest+qty;
//		그 합의 묶음
		int bundle = itemRest/100;
//		100의 자리를 제외한 남은 재수
		itemRest=itemRest-(bundle*100);
		
		if(bundle>=1) {
			map.put("bundle",bundle);
//			store 재고 업데이트 메소드
		}
		
//		여기서 추가한 맵은 updateRecord에 사용
		map.put("itemRest",itemRest);
		
		storeItemDAO.updateRecord(map);
	}
	
	
	
	
//	재료가 아닌 완제품일때
	@Override
	public void saleRecord2(Sale sale) {
		
		storeItemDAO.insertSale(sale);
		
		int qty = sale.getSaleQty();
		String item =sale.getSaleProduct();
		
		calculator2(qty,item);
	}
	
	public void calculator2(int qty,String item) {
//		여기서 추가합 맵은 updateRecord 및 updateItem 두개의 메소드에 사용
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("item", item);
		int itemRest= storeItemDAO.selectItemRest(item);
		
		
//		store 재고 업데이트 메소드
	}
	
	
	
	


}
