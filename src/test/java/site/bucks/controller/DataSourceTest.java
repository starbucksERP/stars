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
	
//	DataSource ���� Ŭ������ Spring Bean�� �����޾� �ʵ忡 ������ ó��
	@Autowired
	private DataSource dataSource;
	
//	@Test : �׽�Ʈ �޼ҵ带 �����ϴ� ������̼�
//	=> Runner Ŭ������ ���� ȣ��Ǿ� ����Ǵ� �޼ҵ� ����
	@Test
	public void testDataSource() throws SQLException {
		logger.info("DataSource = " + dataSource);
		logger.info("Connection = " + dataSource.getConnection());
	}
	
	
}