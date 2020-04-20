package site.bucks.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.HewonTest;
import site.bucks.mapper.HewonTestMapper;

@Repository
public class HewonTestDAOImpl implements HewonTestDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public HewonTest selectHewonTestList(int hewonStId) {
		return sqlSession.getMapper(HewonTestMapper.class).selectHewonTestList(hewonStId);
	}

}
