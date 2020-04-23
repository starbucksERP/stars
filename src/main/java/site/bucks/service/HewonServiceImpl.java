package site.bucks.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.bucks.dao.HewonDAO;
import site.bucks.dto.Hewon;
import site.bucks.exception.HewonExistsException;
import site.bucks.exception.HewonNotFoundException;
import site.bucks.exception.LoginAuthFailException;

@Service
public class HewonServiceImpl implements HewonService {
	
	@Autowired
	private HewonDAO hewonDAO;

	@Override
	public Hewon getHewonStIdList(int hewonStId) {
		return hewonDAO.selectHewonStIdList(hewonStId);
	}

	@Transactional
	@Override
	public void addHewon(Hewon hewon) throws HewonExistsException {
		if(hewonDAO.selectHewon(hewon.getHewonId())!=null) {
			throw new HewonExistsException(hewon, "이미 사용중인 아이디를 입력 하였습니다.");
		}
		
		//입력되어 전달된 비밀번호는 암호화 처리하여 변경
		// => 요청처리 메소드 또는 JavaBean(DTO) 클래스의 Setter 메소드에서 변경 가능
		//BCrypt.hashpw(String HewonPassword, String salt) : 전달받은 비밀번호에
		//첨가물을 사용하여 암호화 처리 후 반환하는 메소드
		//BCrypt.gensalt(int log_rounds) :  첨가물의 길이를 전달받아 첨가물을 생성하여 반환하는 메소드
		// => 매개변수에 첨가물의 길이 전달 생략 가능 - 기본값 : 10 
		hewon.setHewonPassword(BCrypt.hashpw(hewon.getHewonPassword(), BCrypt.gensalt(10)));
		//회원상태는 1(일반계정)으로 변경
		hewon.setHewonGrade("1");
		
		hewonDAO.insertHewon(hewon);
	}

	@Transactional
	@Override
	public void modifyHewon(Hewon hewon) throws HewonNotFoundException {
		if(hewonDAO.selectHewon(hewon.getHewonId())==null) {
			throw new HewonNotFoundException("아이디의 회원정보가 존재하지 않습니다.");
		}
		
		String HewonPassword=hewon.getHewonPassword();
		//비밀번호를 변경할 경우
		if(HewonPassword!=null && !HewonPassword.equals("")) {
			hewon.setHewonPassword(BCrypt.hashpw(hewon.getHewonPassword(), BCrypt.gensalt(10)));
		}
		
		hewonDAO.updateHewon(hewon);
	}

	@Transactional
	@Override
	public void removeHewon(String hewonId) throws HewonNotFoundException {
		if(hewonDAO.selectHewon(hewonId)==null) {
			throw new HewonNotFoundException("아이디의 회원정보가 존재하지 않습니다.");
		}
		hewonDAO.deleteHewon(hewonId);
	}

	@Override
	public Hewon getHewon(String hewonId) throws HewonNotFoundException {
		Hewon hewon=hewonDAO.selectHewon(hewonId);
		if(hewon==null) {
			throw new HewonNotFoundException("아이디의 회원정보가 존재하지 않습니다.");
		}
		return hewon;
	}

	@Override
	public List<Hewon> getHewonList() {
		return hewonDAO.selectHewonList();
	}

	//인증처리 메소드 : 예외가 발생되면 인증 실패, 예외가 발생되지 않으면 인증 성공
	@Override
	public void loginAuth(Hewon hewon) throws LoginAuthFailException {
		Hewon authHewon=hewonDAO.selectHewon(hewon.getHewonId());
		if(authHewon==null) {
			throw new LoginAuthFailException(hewon.getHewonId()
					, "아이디의 회원정보가 존재하지 않습니다.");
		}
		
		//BCrypt.checkpw(String plaintext, String hashed) : 일반 문자열과
		//암호화 처리된 문자열을 비교하여 같은 경우 true를 반환하는 메소드
		if(!BCrypt.checkpw(hewon.getHewonPassword(), authHewon.getHewonPassword())) {
			throw new LoginAuthFailException(hewon.getHewonId()
					, "아이디가 없거나 비밀번호가 맞지 않습니다.");
		}
	}
	
}
