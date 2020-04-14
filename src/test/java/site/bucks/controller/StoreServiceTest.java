package site.bucks.controller;

import java.util.List;

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
import site.bucks.dto.Store;
import site.bucks.service.StoreService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StoreServiceTest {
	private static Logger logger= LoggerFactory.getLogger(StoreServiceTest.class);
	
	@Autowired
	private StoreService storeService;
	/*
	dao 메소드 
	@Autowired
	private StoreDAO storeDAO;
	
	
	4/10 테스트 완료 
	@Test
	public void testDAO() {
		int storeId=121;
		String storeName="스타벅스 강남점";
		
		Store store1=storeDAO.selectstoreId(storeId);
		Store store2=storeDAO.selectStoreName(storeName);
		
		logger.info(store1.getStoreName() +"///"+store2.getstoreId());
	}
	*/

	@Test
	public void test1addStore() {
		Store store=new Store();
		store.setStoreName("스타벅스 청주점");
		store.setStoreOwner("호랑이");
		store.setStoreAddress("충청남도 청주시");
		store.setStorePhone("12387989849");
		storeService.addStore(store);
	}
	
	@Test
	public void test2closeStore() {
		Store store=new Store();
		int storeId=562;
		store.setStoreId(storeId);
		storeService.removeStore(storeId);
	}
	
	@Test
	public void test3modifyStore() {
		Store store=new Store();
		store.setStoreId(562);
		String address="테스트 주소";
		String phone= "테스트 번호";
		store.setStoreAddress(address);
		store.setStorePhone(phone);
		storeService.modifyStore(store);
		logger.info(store.toString());
	}
	
	@Test
	public void test4getStoreList() {
		Store store= new Store();
		List<Store> storeList= storeService.getStoreList(store);
		for(Store storeTest:storeList) {
			logger.info(storeTest.toString());
		}
	}

}
