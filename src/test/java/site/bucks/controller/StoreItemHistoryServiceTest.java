package site.bucks.controller;

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
	
	
}
