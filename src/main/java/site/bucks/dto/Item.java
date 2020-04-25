package site.bucks.dto;

import java.util.List;

/*ass

이름          널?       유형            
----------- -------- ------------- 
ITEM_NUM    NOT NULL VARCHAR2(50)  
ITEM_NAME   NOT NULL VARCHAR2(100) 
ITEM_QTY    NOT NULL NUMBER        
MIN_QTY              NUMBER        
ITEM_PPRICE NOT NULL NUMBER        
ITEM_SPRICE NOT NULL NUMBER        
ITEM_MARGIN          NUMBER        
ITEM_VENDOR NOT NULL VARCHAR2(50)  
ITEM_DM              VARCHAR2(20)  
ITEM_USAGE  NOT NULL NUMBER        
 
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
	private String category;
	private String subCategory;
	private int itemPpricePair;
	private int itemSpricePair;
	private double itemQtyPair;
	private List<String> categorys;
	
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

	
//	寃�����
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

	public int getItemPpricePair() {
		return itemPpricePair;
	}

	public void setItemPpricePair(int itemPpricePair) {
		this.itemPpricePair = itemPpricePair;
	}

	public int getItemSpricePair() {
		return itemSpricePair;
	}

	public void setItemSpricePair(int itemSpricePair) {
		this.itemSpricePair = itemSpricePair;
	}

	public List<String> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<String> categorys) {
		this.categorys = categorys;
	}

	public double getItemQtyPair() {
		return itemQtyPair;
	}

	public void setItemQtyPair(double itemQtyPair) {
		this.itemQtyPair = itemQtyPair;
	}
	
}
