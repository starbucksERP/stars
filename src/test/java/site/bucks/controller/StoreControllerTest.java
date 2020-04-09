package site.bucks.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
//	���ϵ� ����(*)�� �̿��Ͽ� Bean Configuration File ���� ����
//	=> ** ���·� ���丮�� ǥ���ϸ� 0�� �̻�
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StoreControllerTest {
	
private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
//	WebApplicationContext : Web Application ���� ����ϴ� Spring Container ����� �ν��Ͻ�
	@Autowired
	private WebApplicationContext wac;
	
//	MockMvc : ��û�� ���� ����� �������� �����ϱ� ���� Ŭ����
	private MockMvc mvc;
	
//	@Before : �׽�Ʈ �޼ҵ� ȣ�� �� ����� ������ �ۼ��� �޼ҵ忡 �����ϴ� ������̼� - �ʱ�ȭ �۾�
	@Before
	public void setup() {
//		��û�� ���� ����� �����ϴ� ��ü�� ��ȯ�޾� �ʵ忡 ����
		mvc=MockMvcBuilders.webAppContextSetup(wac).build();
		logger.info("MockMvc ��ü ����");
	}
	
	@Test
	public void testStudentDisplay() throws Exception {
//		MockMvc.perform(RequestBuilder request) : �������� Frot Controller���� ���ϴ� ����� ��û�ϴ� �޼ҵ� - ResultActions ��ü ��ȯ
//		MockMvcRequestBuilders.get(String uri) : URL �ּҸ� �����Ͽ� GET������� ��û�ϴ� �޼ҵ�
//		ResultActions.andReturn() : ��ûó�� �޼ҵ��� ȣ�� �����(MvcResult ��ü) ��ȯ�ϴ� �޼ҵ� 
		MvcResult result= mvc.perform(MockMvcRequestBuilders.get("/storeSta")).andReturn();
		logger.info(result.getModelAndView().getViewName());
		logger.info(result.getModelAndView().getModel().toString());
	}
	
	
	
}