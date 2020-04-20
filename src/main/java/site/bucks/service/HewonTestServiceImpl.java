package site.bucks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.bucks.dao.HewonTestDAO;
import site.bucks.dto.HewonTest;

@Service
public class HewonTestServiceImpl implements HewonTestService {
	
	@Autowired
	private HewonTestDAO hewonTestDAO;

	@Override
	public HewonTest getHewonTestStId(int hewonStId) {
		return hewonTestDAO.selectHewonTestList(hewonStId);
	}

}
