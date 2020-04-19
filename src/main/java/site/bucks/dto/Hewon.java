package site.bucks.dto;

/*
이름             널?       유형            
-------------- -------- ------------- 
HEWON_ID       NOT NULL VARCHAR2(50)  
HEWON_NAME     NOT NULL VARCHAR2(50)  
HEWON_PASSWORD NOT NULL VARCHAR2(100) 
HEWON_ADDRESS  NOT NULL VARCHAR2(200) 
HEWON_PHONE    NOT NULL VARCHAR2(100) 
HEWON_EMAIL    NOT NULL VARCHAR2(100) 
HEWON_GRADE    NOT NULL VARCHAR2(50)  
HEWON_JOINDATE NOT NULL DATE          
HEWON_ST_ID             NUMBER  
*/
public class Hewon {
	private String hewonId;
	private String hewonName;
	private String hewonPassword;
	private String hewonAddress;
	private String hewonPhone;
	private String hewonEmail;
	private String hewonGrade;
	private String hewonJoinDate;
	private int hewonStId;
	
//	HEWONTEST 테이블에 없고, STORE 테이블에 존재 
	private String storeName;
	
	public Hewon() {
		// TODO Auto-generated constructor stub
	}

	public String getHewonId() {
		return hewonId;
	}

	public void setHewonId(String hewonId) {
		this.hewonId = hewonId;
	}

	public String getHewonName() {
		return hewonName;
	}

	public void setHewonName(String hewonName) {
		this.hewonName = hewonName;
	}

	public String getHewonPassword() {
		return hewonPassword;
	}

	public void setHewonPassword(String hewonPassword) {
		this.hewonPassword = hewonPassword;
	}

	public String getHewonAddress() {
		return hewonAddress;
	}

	public void setHewonAddress(String hewonAddress) {
		this.hewonAddress = hewonAddress;
	}

	public String getHewonPhone() {
		return hewonPhone;
	}

	public void setHewonPhone(String hewonPhone) {
		this.hewonPhone = hewonPhone;
	}

	public String getHewonEmail() {
		return hewonEmail;
	}

	public void setHewonEmail(String hewonEmail) {
		this.hewonEmail = hewonEmail;
	}

	public String getHewonGrade() {
		return hewonGrade;
	}

	public void setHewonGrade(String hewonGrade) {
		this.hewonGrade = hewonGrade;
	}

	public String getHewonJoinDate() {
		return hewonJoinDate;
	}

	public void setHewonJoinDate(String hewonJoinDate) {
		this.hewonJoinDate = hewonJoinDate;
	}

	public int getHewonStId() {
		return hewonStId;
	}

	public void setHewonStId(int hewonStId) {
		this.hewonStId = hewonStId;
	}
	
	
//  DB에는 없는 컬럼 
	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	


}
