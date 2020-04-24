package site.bucks.controller;

import java.util.HashMap;
import java.util.List;
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

import site.bucks.dao.AccountDAO;
import site.bucks.dto.Account;
import site.bucks.dto.StoreItemHistory;
import site.bucks.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class AccountServiceTest {
	private static Logger logger= LoggerFactory.getLogger(AccountServiceTest.class);

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountDAO accountDAO;
	
	// 4/23 �������� Ȯ�� 
	@Test
	public void test1() {
		StoreItemHistory sih=new StoreItemHistory();
		accountDAO.selectPurchaseSaleList(sih);
	}


}










