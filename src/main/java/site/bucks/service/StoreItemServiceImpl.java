package site.bucks.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.StoreItemDAO;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;

@Service
public class StoreItemServiceImpl implements StoreItemService{
	
	@Autowired
	private StoreItemDAO storeItemDAO;
	
//	판매 기록
	@Override
	public void addSale(Sale sale) {
//		판매기록시 완제품 분별
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
//		판매기록
		storeItemDAO.insertSale(sale);
		
		if(pr!=null) {
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
//			판매량 재고 업데이트 
			storeItemDAO.updateStoreItemRecord(sale);
		}
		
		
	}
	
	public void calculator(String item, Sale sale, int num) {
//		상품명을 재료 명으로 다시 등록(소수점화)
		sale.setSaleProduct(item);
		
		if(num==0) {
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
	public List<Sale> getSaleList(Sale sale) {
		return storeItemDAO.selectSaleList(sale);
	}
	
	
//	판매 상품 카테고리검색	saleProductCategory
	@Override
	public List<ProductRecipe> getProductCategory(String category) {
		return  storeItemDAO.selectCategory(category);
	}
	
//	판매 상품 검색		saleProduct
	@Override
	public ProductRecipe getProductName(String saleProduct) {
		return  storeItemDAO.selectProduct(saleProduct);
	}
	
//	판매상품명검색
	@Override
	public ProductRecipe getProductName2(String category) {
		return storeItemDAO.selectProductName(category);
	}
	
	
	
	
	
	
	
	
	

	@Override
	public List<StoreItem> getStoreItemList(StoreItem storeItem) {
		return storeItemDAO.selectStoreItemList(storeItem);
	}

	@Override
	public StoreItem getStoreItem(StoreItem storeItem) {
		return storeItemDAO.selectStoreItem(storeItem);
	}

	@Override
	public void removeStoreItem(StoreItem storeItem) {
		storeItemDAO.deleteStoreItem(storeItem);
	}

	@Override
	public void modifyStoreItem(StoreItem storeItem) {
		storeItemDAO.updateStoreItem(storeItem);
	}




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



}
