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
	
//	��留� 湲곕�
	@Override
	public void addSale(Sale sale) {
//		��留ㅺ린濡��� ������ 遺�蹂�
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
//		��留ㅺ린濡�
		storeItemDAO.insertSale(sale);
		
		if(pr!=null) {
//			��留� ������ ��������(���щ��닿린 ��臾몄��)
			sale.setSaleQty(sale.getSaleQty()*0.1);
			
			String item1=pr.getItem1();		
			String item2=pr.getItem2();
			String item3=pr.getItem3();
//			湲곕��멸구 吏����댁＜�� �レ��
			int num=0;
			
			calculator(item1, sale, num);
			if(item2!=null) {
				calculator(item2, sale, num);
			}
			if(item3!=null) {
				calculator(item3, sale, num);
			}
			
		}else {
//			��留ㅻ�� �ш� ���곗�댄�� 
			storeItemDAO.updateStoreItemRecord(sale);
		}
		
		
	}
	
	public void calculator(String item, Sale sale, int num) {
//		����紐��� �щ� 紐��쇰� �ㅼ�� �깅�(��������)
		sale.setSaleProduct(item);
		
		if(num==0) {
//			�깅��� 媛��� 洹몃��濡� 湲곕�
			storeItemDAO.updateStoreItemRecord(sale);
		}else if(num==9) {
//			�깅��� 媛��� 洹몃��濡� 濡ㅻ갚
			storeItemDAO.updateStoreItemBack(sale);
		}
		
	}

	
//	��留ㅼ����
	@Override
	public void removeSale(Sale sale) {
//		�쇰�� ���� 硫�����
		storeItemDAO.deleteSale(sale);
		
//		���� 遺�瑜�
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
		
		if(pr!=null) {
//			��留� ������ ��������(���щ��닿린 ��臾몄��)
			sale.setSaleQty(sale.getSaleQty()*0.1);
			
			String item1=pr.getItem1();		
			String item2=pr.getItem2();
			String item3=pr.getItem3();
			
//			濡ㅻ갚�멸구 吏����댁＜�� �レ��
			int num=9;
			
			calculator(item1, sale, num);
			
			if(item2!=null) {
				calculator(item2, sale, num);
			}
			if(item3!=null) {
				calculator(item3, sale, num);
			}
			
		}else {
//			��留ㅻ�� �ш� ���곗�댄�� 
			storeItemDAO.updateStoreItemBack(sale);
		}
		
	}
	
	
//	��留ㅼ“��
	@Override
	public List<Sale> getSaleList(Sale sale) {
		return storeItemDAO.selectSaleList(sale);
	}
	
	
//	��留� ���� 移댄��怨�由ш���	saleProductCategory
	@Override
	public List<ProductRecipe> getProductCategory(String category) {
		return  storeItemDAO.selectCategory(category);
	}
	
//	��留� ���� 寃���		saleProduct
	@Override
	public ProductRecipe getProductName(String saleProduct) {
		return  storeItemDAO.selectProduct(saleProduct);
	}
	
//	��留ㅼ����紐�寃���
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
