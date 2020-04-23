package site.bucks.dao;

import java.util.List;

import site.bucks.dto.Hewon;

public interface HewonDAO {

	Hewon selectHewonStIdList(int hewonStId);
	int insertHewon(Hewon hewon);
	int updateHewon(Hewon hewon);
	int deleteHewon(String hewonId);
	Hewon selectHewon(String hewonId);
	List<Hewon> selectHewonList();
}
