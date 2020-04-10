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
//	와일드 문자(*)을 이용하여 Bean Configuration File 설정 가능
//	=> ** 형태로 디렉토리를 표현하면 0개 이상
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StoreControllerTest {
	
private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
//	WebApplicationContext : Web Application 에서 사용하는 Spring Container 기능의 인스턴스
	@Autowired
	private WebApplicationContext wac;
	
//	MockMvc : 요청과 응답 기능을 가상으로 제공하기 위한 클래스
	private MockMvc mvc;
	
//	@Before : 테스트 메소드 호출 전 실행될 명령을 작성할 메소드에 설정하는 어노테이션 - 초기화 작업
	@Before
	public void setup() {
//		요청과 응답 기능을 제공하는 객체를 반환받아 필드에 저장
		mvc=MockMvcBuilders.webAppContextSetup(wac).build();
		logger.info("MockMvc 객체 생성");
	}
	
	@Test
	public void testStudentDisplay() throws Exception {
//		MockMvc.perform(RequestBuilder request) : 가상으로 Front Controller에게 원하는 기능을 요청하는 메소드 - ResultActions 객체 반환
//		MockMvcRequestBuilders.get(String uri) : URL 주소를 전달하여 GET방식으로 요청하는 메소드
//		ResultActions.andReturn() : 요청처리 메소드의 호출 결과를(MvcResult 객체) 반환하는 메소드 
		MvcResult result= mvc.perform(MockMvcRequestBuilders.get("/storeSta")).andReturn();
		logger.info(result.getModelAndView().getViewName());
		logger.info(result.getModelAndView().getModel().toString());
	}
	
	
	
}
