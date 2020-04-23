package site.bucks.exception;
import site.bucks.dto.Hewon;

//회원등록시 사용자가 입력한 아이디가 이미 존재할 경우 발생되는 예외클래스 
public class HewonExistsException extends Exception {
	private static final long serialVersionUID = 1L;
	
	//예외처리 메소드(ExceptionHandler)에게 예외 관련 정보를 전달하기 위한 필드
	private Hewon hewon;
	
	public HewonExistsException() {
		// TODO Auto-generated constructor stub
	}

	public HewonExistsException(Hewon hewon, String message) {
		super(message);
		this.hewon = hewon;
	}

	public Hewon getHewon() {
		return hewon;
	}

	public void setHewon(Hewon hewon) {
		this.hewon = hewon;
	}
	
	
	
}
