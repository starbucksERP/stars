package site.bucks.dto;

/*
�대�             ��?       ����            
-------------- -------- ------------- 
PURCHASE_SEQ   NOT NULL NUMBER        
REQUEST_NUM    NOT NULL VARCHAR2(200) 
PURCHASE_STATE NOT NULL NUMBER        
PURCHASE_DATE  NOT NULL DATE          
ITEM_NUM       NOT NULL VARCHAR2(200) 
ITEM_QTY       NOT NULL NUMBER        
ITEM_PPRICE    NOT NULL NUMBER        
ITEM_VENDOR    NOT NULL VARCHAR2(200) 
PURCHASE_TYPE  NOT NULL NUMBER          
 */
public class Purchase {
	
	private int purchaseSeq;
	private String requestNum;
	private int purchaseState;
	private String purchaseDate;
	private String purchaseDateTwo; // 援щℓ���⑹“������ ��吏� 踰���寃����� ���� 蹂��� 
	private String itemNum;
	private Item item; // 援щℓ���� 議고������ Join�� �댁�⑺�� select �ъ�⑹�� ������ 蹂��� 
	private int ItemQty;
	private int itemPprice;
	private int itemPpriceTwo; // 援щℓ���⑹“������ 媛�寃� 踰���寃����� ���� 蹂���
	private int nowPurchaseState; // 援щℓ愿��� ���댁�蹂� �대�� ���댁��� 湲곕낯 list 異��μ�� ���� 蹂���
	private String itemVendor;
	private int purchaseType;

	private String itemName;
	
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

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	


	
	
	
}
