package site.bucks.dto;
 
/*ass

이름          널?       유형           
----------- -------- ------------ 
ITEM_NUM    NOT NULL VARCHAR2(50) 
ITEM_NAME   NOT NULL VARCHAR2(20) 
ITEM_QTY    NOT NULL NUMBER       
MIN_QTY              NUMBER       
ITEM_PPRICE NOT NULL NUMBER       
ITEM_SPRICE NOT NULL NUMBER       
ITEM_MARGIN          NUMBER       
ITEM_VENDOR NOT NULL VARCHAR2(50) 
ITEM_DM              VARCHAR2(20) 
ITEM_USAGE           NUMBER       
 
 */

public class Item {
	private String itemNum;
	private String itemName;  
	private double itemQty;
	private int minQty;
	private int itemPprice;
	private int itemSprice;
	private int itemMargin;
	private String itemVendor;
	private String itemDm;
	private int itemUsage;
	private int seq;
	
//	검색용
	private String category;
	private String subCategory;
	
	public Item() {
		// TODO Auto-generated constructor stub
	}

	public String getItemNum() {
		return itemNum;
	}

	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getItemQty() {
		return itemQty;
	}

	public void setItemQty(double itemQty) {
		this.itemQty = itemQty;
	}

	public int getMinQty() {
		return minQty;
	}

	public void setMinQty(int minQty) {
		this.minQty = minQty;
	}

	public int getItemPprice() {
		return itemPprice;
	}

	public void setItemPprice(int itemPprice) {
		this.itemPprice = itemPprice;
	}

	public int getItemSprice() {
		return itemSprice;
	}

	public void setItemSprice(int itemSprice) {
		this.itemSprice = itemSprice;
	}

	public int getItemMargin() {
		return itemMargin;
	}

	public void setItemMargin(int itemMargin) {
		this.itemMargin = itemMargin;
	}

	public String getItemVendor() {
		return itemVendor;
	}

	public void setItemVendor(String itemVendor) {
		this.itemVendor = itemVendor;
	}

	public String getItemDm() {
		return itemDm;
	}

	public void setItemDm(String itemDm) {
		this.itemDm = itemDm;
	}

	public int getItemUsage() {
		return itemUsage;
	}

	public void setItemUsage(int itemUsage) {
		this.itemUsage = itemUsage;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	
//	검색용
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	
	

}
