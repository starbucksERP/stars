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
	//dao 메소드 
	/*
	@Autowired
	private StoreDAO storeDAO;
	
	
	//4/16 지현이 테스트 완료 
	@Test
	public void testDAO() {
		int storeId=3031;
		String storeName="스타벅스 노원점";
		
		Store store1=storeDAO.selectstoreId(storeId);
		Store store2=storeDAO.selectStoreName(storeName);
		
		logger.info(store1.getStoreName() +"///"+store2.getStoreId());
	}
	
	//4/16 지현이 테스트 완료
	@Test
	public void test1addStore() {
		Store store=new Store();
		store.setStoreName("스타벅스 구리점");
		store.setStoreAddress("경기도 구리시");
		store.setStoreOwner("안구리");
		store.setStorePhone("031234234");
		store.setStoreState("1");
		store.setstoreOpen("2020/02/28");
		storeService.addStore(store);
	}

	//보류 - 테스트는 OK
	@Test
	public void test2closeStore() {
		Store store=new Store();
		String storeClose="20/03/01";
		int storeId=1029;
		store.setStoreClose(storeClose);
		store.setStoreId(storeId);
		storeService.removeStore(store);
	}
	
	//4/16 지현이 테스트 완료
	@Test
	public void test3modifyStore() {
		Store store=new Store();
		store.setStoreId(13023);
		store.setStoreName("스타벅스 청주점");
		store.setStoreAddress("폐업 테스트에옹");
		store.setStoreOwner("호랑이");
		store.setStorePhone("테스트 버노에용");
		store.setStoreState(9);
		store.setstoreOpen("2020/02/28");
		store.setStoreClose("2020/03/01");
		storeService.modifyStore(store);
		logger.info(store.toString());
	}
	 */
	
	//4/16 지현이 테스트 완료
	@Test
	public void test4getStoreList() {
		List<Store> storeList= storeService.getStoreList();
		for(Store storeTest:storeList) {
			logger.info(storeTest.toString());
		}
	}
}











