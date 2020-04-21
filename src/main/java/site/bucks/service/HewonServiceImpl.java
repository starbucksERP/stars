package site.bucks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.HewonDAO;
import site.bucks.dto.Hewon;

@Service
public class HewonServiceImpl implements HewonService {
	
	@Autowired
	private HewonDAO hewonDAO;

	@Override
	public Hewon getHewonStIdList(int hewonStId) {
		return hewonDAO.selectHewonStIdList(hewonStId);
	}

}
