package site.bucks.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.StoreItemDAO;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.SaleItem;

@Service
public class StoreItemServiceImpl implements StoreItemService{
	
	@Autowired
	private StoreItemDAO storeItemDAO;
	
//	판매 기록
	@Override
	public void addSale(Sale sale) {
//		판매기록시 완제품 분별
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
		
		if(pr!=null) {
//			레시피 테이블에서 상품가격 가져와서 개수 곱해서 총합 저장
			sale.setSalePriceSum(pr.getProductPrice()*(int)sale.getSaleQty());
//			판매기록
			storeItemDAO.insertSale(sale);
			
//			판매 수량을 소수점화(원재료이기 때문에)
			sale.setSaleQty(sale.getSaleQty()*0.1);
			
			String item1=pr.getItem1();		
			String item2=pr.getItem2();
			String item3=pr.getItem3();
			
//			기록인걸 지정해주는 숫자
			int num=0;
			
			calculator(item1, sale, num);
			
			if(item2!=null) {
				calculator(item2, sale, num);
			}
			if(item3!=null) {
				calculator(item3, sale, num);
			}
			
		}else {
//			지점 테이블에서 상품가격 가져와서 개수 곱해서 총합 저장
			sale.setSalePriceSum(storeItemDAO.selectStoreItemPrice(sale).getItemPrice()*(int)sale.getSaleQty());
//			판매 기록
			storeItemDAO.insertSale(sale);
//			판매량 재고 업데이트 
			storeItemDAO.updateStoreItemRecord(sale);
		}
		
		
	}
	
	public void calculator(String item, Sale sale, int num) {
//		상품명을 재료 명으로 다시 등록(소수점화)
		sale.setSaleProduct(item);
		
		if(num==1) {
//			등록한 개수 그대로 기록
			storeItemDAO.updateStoreItemRecord(sale);
		}else if(num==9) {
//			등록한 개수 그대로 롤백
			storeItemDAO.updateStoreItemBack(sale);
		}
		
	}

	
//	판매삭제
	@Override
	public void removeSale(Sale sale) {
//		일단 삭제 메소드
		storeItemDAO.deleteSale(sale);
		
//		제품 분류
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
		
		if(pr!=null) {
//			판매 수량을 소수점화(원재료이기 때문에)
			sale.setSaleQty(sale.getSaleQty()*0.1);
			
			String item1=pr.getItem1();		
			String item2=pr.getItem2();
			String item3=pr.getItem3();
			
//			롤백인걸 지정해주는 숫자
			int num=9;
			
			calculator(item1, sale, num);
			
			if(item2!=null) {
				calculator(item2, sale, num);
			}
			if(item3!=null) {
				calculator(item3, sale, num);
			}
			
		}else {
//			판매량 재고 업데이트 
			storeItemDAO.updateStoreItemBack(sale);
		}
		
	}
	
	
	
	
//	판매조회
	@Override
	public List<SaleItem> getSaleList(Sale sale) {
		return storeItemDAO.selectSaleList(sale);
	}

//	카테고리별 판매 상품 검색
	@Override
	public Map<String, Object> getSaleProductName(Sale sale) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(sale.getsaleCategory().equals("A")) {
			map.put("saleProduct2", storeItemDAO.selectSaleProductName2(sale));
		}else {
			map.put("saleProduct1", storeItemDAO.selectSaleProductName1(sale));
		}
		return map;
	}
	


}
