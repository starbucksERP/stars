package site.bucks.controller;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DataSourceTest {
	
	private static final Logger logger=LoggerFactory.getLogger(DataSourceTest.class);
	
//	DataSource 관련 클래스의 Spring Bean을 제공받아 필드에 인젝션 처리
	@Autowired
	private DataSource dataSource;
	
//	@Test : 테스트 메소드를 설정하는 어노테이션
//	=> Runner 클래스에 의해 호출되어 실행되는 메소드 설정
	@Test
	public void testDataSource() throws SQLException {
		logger.info("DataSource = " + dataSource);
		logger.info("Connection = " + dataSource.getConnection());
	}
	
	
}
