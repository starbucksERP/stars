package site.bucks.dto;

/*
이름            널?       유형            
------------- -------- ------------- 
HEWON_ID      NOT NULL VARCHAR2(50)  
HEWON_NAME    NOT NULL VARCHAR2(50)  
HEWON_ADDRESS NOT NULL VARCHAR2(200) 
HEWON_PHONE   NOT NULL VARCHAR2(100) 
HEWON_EMAIL   NOT NULL VARCHAR2(100) 
HEWON_ST_ID            NUMBER  
*/
public class HewonTest {
	private String hewonId;
	private String hewonName;
	private String hewonAddress;
	private String hewonPhone;
	private String hewonEmail;
	private int hewonStId;
	private String hewonStoreName;
	
	public HewonTest() {
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

	public int getHewonStId() {
		return hewonStId;
	}

	public void setHewonStId(int hewonStId) {
		this.hewonStId = hewonStId;
	}

//	DB에는 없는 컬럼
	public String getHewonStoreName() {
		return hewonStoreName;
	}

	public void setHewonStoreName(String hewonStoreName) {
		this.hewonStoreName = hewonStoreName;
	}
	
	
	

}
