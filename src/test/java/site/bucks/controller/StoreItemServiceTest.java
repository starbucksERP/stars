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
	
	
//	4/11 테스트 완료
	/*
	@Test
	public void test1addSale() {
		Sale sale= new Sale();
		sale.setSaleProduct("바닐라 크림 콜드 브루");
		sale.setSaleQty(99);
		
		storeItemService.addSale(sale);
		
	}
	*/
	
	
	/*
	@Autowired
	private StoreItemDAO storeItemDAO;
	
	4/10 
	update 1, update 2, selectCategory 테스트 성공
	@Test
	public void test1saleRecord() {
		Sale sale = new Sale();
		sale.setSaleProduct("로고 코인 다크 초콜릿");
		logger.info(storeItemDAO.selectCategory(sale.getSaleProduct()));
	}
	
	@Test
	public void test1saleRecord() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleProduct", "버터 가득 라이스 쿠키");
		map.put("storeItemQty", 10);
		storeItemDAO.updateStoreItem1(map);
	}
	*/
	
}
