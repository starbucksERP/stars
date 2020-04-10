package site.bucks.dto;

/*	record 테이블(재고 잔량 계산 테이블)
 
 이름        널?       유형           
--------- -------- ------------ 
RECORD_NO NOT NULL NUMBER       
ITEM      NOT NULL VARCHAR2(50) 
ITEM_REST NOT NULL NUMBER(4)   
 
 */

public class Record {
	private int recordNo;
	private int item;
	private int itemRest;
	
	public Record() {
		// TODO Auto-generated constructor stub
	}

	public int getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getItemRest() {
		return itemRest;
	}

	public void setItemRest(int itemRest) {
		this.itemRest = itemRest;
	}
	
	

}
