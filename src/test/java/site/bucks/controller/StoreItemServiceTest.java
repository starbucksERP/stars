package site.bucks.controller;

import java.util.HashMap;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import site.bucks.dao.StoreDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;
import site.bucks.service.StoreItemService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StoreItemServiceTest {
	private Logger logger=LoggerFactory.getLogger(StoreItemServiceTest.class);
	
	@Autowired
	private StoreItemService storeItemService;
	
	@Autowired
	private StoreItemDAO storeItemDAO;
	
	
//	@Test
//	public void test1addSale() {
//		Sale sale= new Sale();
//		sale.setSaleProduct("쿨 라임 피지오");
//		sale.setSaleQty(20);
//		
//		storeItemService.addSale(sale);
//	}
	
	@Test
	public void test1addSale() {
		Sale sale= new Sale();
		sale.setSaleSeq(1);
		
		storeItemService.removeSale(sale);
	}
	
//	4/11 �׽�Ʈ �Ϸ�
	/*
	@Test
	public void test1addSale() {
		Sale sale= new Sale();
		sale.setSaleProduct("���������� ��Ű�ƶ�");
		sale.setSaleQty(2);
		
		storeItemService.addSale(sale);
		
	}
	*/
	
//	@Autowired
//	private StoreItemDAO storeItemDAO;
//	4/10 
	/*
	@Test
	public void test2saleRecord() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemName", "���� ���� ���̽� ��Ű");
		map.put("itemQty", 10);
		storeItemDAO.updateStoreItem(map);
	}

	
	@Test
	public void test1() {
		Sale sale = new Sale();
		sale.setSaleSeq(68);	
		sale.setStoreId(02354);
		sale.setSaleDate("20/04/14");
		sale.setSaleQty(100);
		sale.setSaleProduct("test");
//		sale.setSalePriceSum(storeItemDAO.selectStoreItemPrice(sale).getItemPrice()*sale.getSaleQty());
		System.out.println(storeItemDAO.selectStoreItemPrice(sale).getItemPrice()*sale.getSaleQty());
	}
	 */
//	/*
//	 * @Test public void test1() { Map<String, Object> map= new HashMap<String,
//	 * Object>(); map.put("category", "B"); // map.put("subCategory", "01");
//	 * storeItemDAO.selectSaleList(map);
//	 * 
//	 * }
//	 */
	
//	@Test
//	public void test2() {
//		Sale sale= new Sale();
//		storeItemService.getSaleList(sale);
//	}

}
