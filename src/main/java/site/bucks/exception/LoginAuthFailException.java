package site.bucks.exception;

//회원 인증 실패시 발생되는 예외클래스
public class LoginAuthFailException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private String hewonId;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}

	public LoginAuthFailException(String hewonId, String message) {
		super(message);
		this.hewonId = hewonId;
	}

	public String getHewonId() {
		return hewonId;
	}

	public void setHewonId(String hewonId) {
		this.hewonId = hewonId;
	}
}
