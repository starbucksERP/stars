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
 */
public class Purchase {
	
	private int purchaseSeq;
	private String requestNum;
	private int purchaseState;
	private String purchaseDate;
	private String itemNum;
	private int ItemQty;
	private int itemPrice;
	
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

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	

}
