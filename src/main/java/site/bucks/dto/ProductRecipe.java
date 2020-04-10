package site.bucks.dto;
/*
  
이름       널?       유형            
-------- -------- ------------- 
PRODUCT  NOT NULL VARCHAR2(500) 
CATEGORY NOT NULL VARCHAR2(200) 
ITEM1    NOT NULL VARCHAR2(50)  
ITEM2             VARCHAR2(50)  
ITEM3             VARCHAR2(50)   
 
 */
public class ProductRecipe {
	private String product;
	private String category;
	private String item1;
	private String item2;
	private String item3;
	
	public ProductRecipe() {
		// TODO Auto-generated constructor stub
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getItem1() {
		return item1;
	}

	public void setItem1(String item1) {
		this.item1 = item1;
	}

	public String getItem2() {
		return item2;
	}

	public void setItem2(String item2) {
		this.item2 = item2;
	}

	public String getItem3() {
		return item3;
	}

	public void setItem3(String item3) {
		this.item3 = item3;
	}
	
	
}
