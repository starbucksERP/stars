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
	
	@Override
	public void saleRecord(Sale sale) {
//		sale�� ���� ��ǰ������ ī�װ�(��ǰ�ڵ� �ʿ�) �˻� ->
//		String category=storeItemDAO.selectCategory(sale).substring(0,2);
		String category="";
		if(!category.equals("A01")) {
			saleRecord1(sale);
		}else {
			saleRecord2(sale);
		}
		
	}
	
	
//	���� ������ ����
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
//		���⼭ �߰��� ���� updateRecord �� updateItem �ΰ��� �޼ҵ忡 ���
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("item", item);
		int itemRest= storeItemDAO.selectItemRest(item);
		
//		���� ��� ��ǰ��� ��
		itemRest=itemRest+qty;
//		�� ���� ����
		int bundle = itemRest/100;
//		100�� �ڸ��� ������ ���� ���
		itemRest=itemRest-(bundle*100);
		
		if(bundle>=1) {
			map.put("bundle",bundle);
//			store ��� ������Ʈ �޼ҵ�
//			storeItemDAO.updateStoreItem1(map);
		}
		
//		���⼭ �߰��� ���� updateRecord�� ���
		map.put("itemRest",itemRest);
		
		storeItemDAO.updateRecord(map);
	}
	
	
	
	
//	��ᰡ �ƴ� ����ǰ�϶�
	public void saleRecord2(Sale sale) {
		
		storeItemDAO.insertSale(sale);
		
		int qty = sale.getSaleQty();
		String item =sale.getSaleProduct();
		
		calculator2(qty,item);
	}
	
	public void calculator2(int qty,String item) {
//		���⼭ �߰��� ���� updateRecord �� updateItem �ΰ��� �޼ҵ忡 ���
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("item", item);
		
//		store ��� ������Ʈ �޼ҵ�
//		storeItemDAO.updateStoreItem2(map);
	}
	
	
	
	


}
