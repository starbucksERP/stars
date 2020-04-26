package site.bucks.exception;

public class UnCommitedCancelOrder extends Exception {
	private static final long serialVersionUID = 1L;
	
	public UnCommitedCancelOrder() {
		// TODO Auto-generated constructor stub
	}
	
	public UnCommitedCancelOrder(String message) {
		super(message);
	}
	
}
