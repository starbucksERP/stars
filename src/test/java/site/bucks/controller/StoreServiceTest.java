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
	
	/* dao �޼ҵ� 
	@Autowired
	private StoreDAO storeDAO;
	
	@Test
	public void testDAO() {
		int storeCode=121;
		String storeName="��Ÿ���� ������";
		
		Store store1=storeDAO.selectStoreCode(storeCode);
		Store store2=storeDAO.selectStoreName(storeName);
		
		logger.info(store1.getName() +"///"+store2.getCode());
	}
	*/
	
//	4/10 �׽�Ʈ �Ϸ� 
	/*
	@Test
	public void test1addStore() {
		Store store=new Store();
		store.setName("��Ÿ���� û����");
		store.setAddress("��û���� û�ֽ�");
		store.setPhone("12387989849");
		storeService.addStore(store);
	}
	
	@Test
	public void test2closeStore() {
		Store store=new Store();
		int storeCode=562;
		store.setCode(storeCode);
		storeService.closeStore(storeCode);
	}
	
	@Test
	public void test3modifyStore() {
		Store store=new Store();
		store.setCode(562);
		String address="�׽�Ʈ �ּ�";
		String phone= "�׽�Ʈ ��ȣ";
		store.setAddress(address);
		store.setPhone(phone);
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
	*/
	

}
