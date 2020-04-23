package site.bucks.dao;

import java.util.List;

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

	@Override
	public int insertHewon(Hewon hewon) {
		return sqlSession.getMapper(HewonMapper.class).insertHewon(hewon);
	}

	@Override
	public int updateHewon(Hewon hewon) {
		return sqlSession.getMapper(HewonMapper.class).updateHewon(hewon);
	}

	@Override
	public int deleteHewon(String hewonId) {
		return sqlSession.getMapper(HewonMapper.class).deleteHewon(hewonId);
	}

	@Override
	public Hewon selectHewon(String hewonId) {
		return sqlSession.getMapper(HewonMapper.class).selectHewon(hewonId);
	}

	@Override
	public List<Hewon> selectHewonList() {
		return sqlSession.getMapper(HewonMapper.class).selectHewonList();
	}

}
