package site.bucks.service;

import java.util.List;

import site.bucks.dto.Hewon;
import site.bucks.exception.HewonExistsException;
import site.bucks.exception.HewonNotFoundException;
import site.bucks.exception.LoginAuthFailException;

public interface HewonService {

	Hewon getHewonStIdList(int hewonStId);
	void addHewon(Hewon Hewon) throws HewonExistsException;
	void modifyHewon(Hewon Hewon) throws HewonNotFoundException;
	void removeHewon(String userid) throws HewonNotFoundException;
	Hewon getHewon(String userid) throws HewonNotFoundException;
	List<Hewon> getHewonList();
	void loginAuth(Hewon Hewon) throws LoginAuthFailException;//인증처리 메소드
	
}
