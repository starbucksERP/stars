package site.bucks.controller;

import java.util.ArrayList;
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

import site.bucks.dao.DeliveryDAO;
import site.bucks.dao.OrderItemDAO;
import site.bucks.dao.StoreItemDAO;
import site.bucks.dao.StoreItemHistoryDAO;
import site.bucks.dto.StoreItemHistory;
import site.bucks.service.StoreItemHistoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StoreItemHistoryServiceTest {
	private Logger logger = LoggerFactory.getLogger(StoreItemHistoryServiceTest.class);
	
	@Autowired
	StoreItemHistoryService storeItemHistoryService;
	
	@Autowired
	StoreItemHistoryDAO storeItemHistoryDAO;
	
	@Autowired
	OrderItemDAO orderItemDAO;
	
//	4/13 test ¿Ï·á
	/*
	@Test
	public void test1print() {
		StoreItemHistory sih= new StoreItemHistory();
		sih.setStoreHistorySeq(987);
		sih.setStoreId(1000);
		sih.setRequestNum("testreqnum");
		sih.setItemNum("testitem");
		sih.setItemName("testitemname");
		sih.setItemState(99);
		sih.setItemQty(100);
		sih.setHistoryDate("20/04/13");
		storeItemHistoryService.modifyReceiptProcess(sih);
		
	}
	*/
	/*
	@Test
	public void test1print() {
		StoreItemHistory sih1= new StoreItemHistory();
		sih1.setStoreHistorySeq(4321);
		sih1.setStoreId(4321);
		sih1.setRequestNum("4321");
		sih1.setItemNum("4321");
		sih1.setItemName("4321");
		sih1.setItemQty(4321);
		
		StoreItemHistory sih2= new StoreItemHistory();
		sih2.setStoreHistorySeq(432);
		sih2.setStoreId(432);
		sih2.setRequestNum("432");
		sih2.setItemNum("432");
		sih2.setItemName("432");
		sih2.setItemQty(432);
		
		StoreItemHistory sih3= new StoreItemHistory();
		sih3.setStoreHistorySeq(43);
		sih3.setStoreId(43);
		sih3.setRequestNum("43");
		sih3.setItemNum("43");
		sih3.setItemName("43");
		sih3.setItemQty(43);
		
		List<StoreItemHistory> sihList= new ArrayList<StoreItemHistory>();
		sihList.add(sih1);
		sihList.add(sih2);
		sihList.add(sih3);
		
		storeItemHistoryService.addRecipt(sihList);
		
//		orderItemDAO.insertOrderItemByStore(sih);
//		storeItemHistoryDAO.insertStoreItemHistory(sih);
	}
	
	
	@Test
	public void test1print() {
		StoreItemHistory sih1= new StoreItemHistory();
		sih1.setStoreHistorySeq(8);
		sih1.setStoreId(43);
		sih1.setRequestNum("43");
		sih1.setItemName("3");
		sih1.setItemNum("3");
		sih1.setItemQty(3);
		sih1.setHistoryDate("20-04-14");
		
		
		List<StoreItemHistory> sihList= new ArrayList<StoreItemHistory>();
		sihList.add(sih1);
		
		storeItemHistoryService.modifyRecipt(sihList);
		
	}
	*/
}
