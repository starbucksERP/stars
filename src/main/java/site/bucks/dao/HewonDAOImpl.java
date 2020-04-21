package site.bucks.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import site.bucks.dto.Hewon;
import site.bucks.mapper.HewonMapper;

@Repository
public class HewonDAOImpl implements HewonDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Hewon selectHewonStIdList(int hewonStId) {
		return sqlSession.getMapper(HewonMapper.class).selectHewonStIdList(hewonStId);
	}

}
