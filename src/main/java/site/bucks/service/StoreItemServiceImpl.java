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
	
//	�ǸŸ� ����ϸ� -> �Ǹ�insert, ��������� ����ǰ���� ������(productRecipe ����) ������ ����� �׾Ƽ�  100�� ���Ͻ� ��� ���� / ����ǰ�Ͻ� ��� �ٷ� ����
	@Override
	public void addSale(Sale sale) {
//		��ǰ�����ǿ� �����ϴ��� ���� �Ǵ� => ���յǴ� ��ǰ���� ����ǰ����
		ProductRecipe pr=storeItemDAO.selectProduct(sale.getSaleProduct());
		
		if(pr!=null) {
			saleRecord(sale, pr);
		}else {
			saleRecord(sale);
		}
		
	}
	
	
//	���� ������ ����
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
//		���⼭ �߰��� ���� updateRecord �� updateItem �ΰ��� �޼ҵ忡 ���
		Map<String, Object> map=new HashMap<String, Object>();
		int itemRest= storeItemDAO.selectItemRest(item);
//		�ڿ��⼭ item=���
		map.put("itemName", item);
		
//		���� ��� ��ǰ��� ��
		itemRest=itemRest+qty;
//		�� ���� ����
		int bundle = itemRest/100;
//		100�� �ڸ��� ������ ���� ���
		itemRest=itemRest-(bundle*100);
		
		if(bundle>=1) {
			map.put("itemQty",bundle);
//			store ��� ������Ʈ �޼ҵ�
			storeItemDAO.updateStoreItem(map);
		}else {
//			���⼭ �߰��� ���� updateRecord�� ���
			map.put("itemRest",itemRest);
			
			storeItemDAO.updateRecord(map);
		}

	}
	
	
	
	
//	��ᰡ �ƴ� ����ǰ�϶�
	public void saleRecord(Sale sale) {
		
		storeItemDAO.insertSale(sale);
		
		int qty = sale.getSaleQty();
		String item =sale.getSaleProduct();
		
		calculator2(qty,item);
	}
	
	public void calculator2(int qty,String product) {
//		���⼭ �߰��� ���� updateRecord �� updateItem �ΰ��� �޼ҵ忡 ���
		Map<String, Object> map=new HashMap<String, Object>();
//		�ڿ��⼭ item=����ǰ
		map.put("itemName", product);
		map.put("itemQty",qty);
		
//		store ��� ������Ʈ �޼ҵ�
		storeItemDAO.updateStoreItem(map);
	}
	
	
	
	


}
