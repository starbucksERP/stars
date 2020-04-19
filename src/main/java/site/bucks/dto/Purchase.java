package site.bucks.dto;

/*
이름             널?       유형           
-------------- -------- ------------ 
PURCHASE_SEQ   NOT NULL NUMBER       
REQUEST_NUM    NOT NULL VARCHAR2(50) 
PURCHASE_STATE NOT NULL NUMBER       
PURCHASE_DATE  NOT NULL DATE         
ITEM_NUM       NOT NULL VARCHAR2(50) 
ITEM_QTY       NOT NULL NUMBER       
ITEM_PPRICE    NOT NULL NUMBER       
ITEM_VENDOR    NOT NULL VARCHAR2(50) 
PURCHASE_TYPE  NOT NULL NUMBER      
 */
public class Purchase {
	
	private int purchaseSeq;
	private String requestNum;
	private int purchaseState;
	private String purchaseDate;
	private String purchaseDateTwo; // 구매현황조회에서 날짜 범위검색을 위한 변수 
	private String itemNum;
	private int ItemQty;
	private int itemPprice;
	private int itemPpriceTwo; // 구매현황조회에서 가격 범위검색을 위한 변수
	private int nowPurchaseState; // 구매관련 페이지별 해당 페이지의 기본 list 출력을 위한 변수
	private String itemVendor;
	private int purchaseType;

	
	public Purchase() {
		// TODO Auto-generated constructor stub
	}

	public int getPurchaseSeq() {
		return purchaseSeq;
	}

	public void setPurchaseSeq(int purchaseSeq) {
		this.purchaseSeq = purchaseSeq;
	}

	public String getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(String requestNum) {
		this.requestNum = requestNum;
	}

	public int getPurchaseState() {
		return purchaseState;
	}

	public void setPurchaseState(int purchaseState) {
		this.purchaseState = purchaseState;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getPurchaseDateTwo() {
		return purchaseDateTwo;
	}

	public void setPurchaseDateTwo(String purchaseDateTwo) {
		this.purchaseDateTwo = purchaseDateTwo;
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public int getItemQty() {
		return ItemQty;
	}

	public void setItemQty(int itemQty) {
		ItemQty = itemQty;
	}

	public int getItemPprice() {
		return itemPprice;
	}

	public void setItemPprice(int itemPprice) {
		this.itemPprice = itemPprice;
	}

	public int getNowPurchaseState() {
		return nowPurchaseState;
	}

	public void setNowPurchaseState(int nowPurchaseState) {
		this.nowPurchaseState = nowPurchaseState;
	}

	public String getItemVendor() {
		return itemVendor;
	}

	public void setItemVendor(String itemVendor) {
		this.itemVendor = itemVendor;
	}

	public int getPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(int purchaseType) {
		this.purchaseType = purchaseType;
	}

	public int getItemPpriceTwo() {
		return itemPpriceTwo;
	}

	public void setItemPpriceTwo(int itemPpriceTwo) {
		this.itemPpriceTwo = itemPpriceTwo;
	}
	
	
}
