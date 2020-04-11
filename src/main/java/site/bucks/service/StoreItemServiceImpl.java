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
	
//	판매를 기록하면 -> 판매insert, 원재료인지 완제품인지 구별후(productRecipe 유무) 원재료면 원재료 쌓아서  100개 모일시 재고 소진 / 완제품일시 재고 바로 소진
	@Override
	public void addSale(Sale sale) {
//		상품레시피에 존재하는지 여부 판단 => 조합되는 상품인지 완제품인지
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
		
		if(pr!=null) {
			saleRecord(sale, pr);
		}else {
			saleRecord(sale);
		}
		
	}
	
	
//	재료로 받을때 조합
	public void saleRecord(Sale sale, ProductRecipe pr) {
		
		storeItemDAO.insertSale(sale);
		int qty = sale.getSaleQty();
		
		String item1=pr.getItem1();
		String item2=pr.getItem2();
		String item3=pr.getItem3();
		
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
		int itemRest= storeItemDAO.selectItemRest(item);
//		★여기서 item=재료
		map.put("itemName", item);
		
//		남은 재고에 상품재고 합
		itemRest=itemRest+qty;
//		그 합의 묶음
		int bundle = itemRest/100;
//		100의 자리를 제외한 남은 재수
		itemRest=itemRest-(bundle*100);
		
		if(bundle>=1) {
			map.put("itemQty",bundle);
//			store 재고 업데이트 메소드
			storeItemDAO.updateStoreItem(map);
		}else {
//			여기서 추가한 맵은 updateRecord에 사용
			map.put("itemRest",itemRest);
			
			storeItemDAO.updateRecord(map);
		}

	}
	
	
	
	
//	재료가 아닌 완제품일때
	public void saleRecord(Sale sale) {
		
		storeItemDAO.insertSale(sale);
		
		int qty = sale.getSaleQty();
		String item =sale.getSaleProduct();
		
		calculator2(qty,item);
	}
	
	public void calculator2(int qty,String product) {
//		여기서 추가합 맵은 updateRecord 및 updateItem 두개의 메소드에 사용
		Map<String, Object> map=new HashMap<String, Object>();
//		★여기서 item=완제품
		map.put("itemName", product);
		map.put("itemQty",qty);
		
//		store 재고 업데이트 메소드
		storeItemDAO.updateStoreItem(map);
	}
	
	
	
	


}
