package site.bucks.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import site.bucks.dto.Item;
import site.bucks.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemContoller {
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String productList() {
		return "item/product_list";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> productList(@RequestBody Item item) { 
		return itemService.getProductList(item);
	}
	
	@RequestMapping(value = "/productEnroll", method = RequestMethod.POST)
	@ResponseBody
	public String productEnroll(@RequestBody Item item) {
		item.setItemName(HtmlUtils.htmlEscape(item.getItemName()).trim());
		item.setItemVendor(HtmlUtils.htmlEscape(item.getItemVendor()).trim());
		itemService.addProduct(item);
		return "success";
	}

	@RequestMapping(value = "/getItem/{itemNum}", method = RequestMethod.GET)
	@ResponseBody
	public Item getItem(@PathVariable String itemNum) {
		return itemService.getItem(itemNum);
	}
	
	@RequestMapping(value = "/productModify", method = {RequestMethod.PUT, RequestMethod.PATCH })
	@ResponseBody
	public String productModify(@RequestBody Item item) {
		item.setItemName(HtmlUtils.htmlEscape(item.getItemName()).trim());
		item.setItemVendor(HtmlUtils.htmlEscape(item.getItemVendor()).trim());
		itemService.modifyProduct(item);
		return "success";
	}
	
	@RequestMapping(value = "/productPause", method = {RequestMethod.PUT, RequestMethod.PATCH })
	@ResponseBody
	public String productPause(@RequestBody Map<String, Object> param) {
		itemService.removeProduct(param);
		return "success";
	}
	
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	
	@RequestMapping(value = "/itemList", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> itemList(@RequestBody Item item) { 
		return itemService.getItemList(item);
	}
	
	@RequestMapping(value = "/itemDelete", method = {RequestMethod.PUT, RequestMethod.PATCH })
	@ResponseBody
	public String itemDelete(@RequestBody Map<String, Object> param) {
		itemService.removeItem(param);
		return "success";
	}
	
	// 구매계획
	@RequestMapping(value = "/productPlan", method = RequestMethod.GET)
	public String productPlanList(){
		return "purchase/purchase_plan";
	}
	@RequestMapping(value = "/productPlan", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> productPlanList(@RequestBody Item item){
		return itemService.getItemPlanList(item);
	}
	@RequestMapping(value = "/changeItemPlan", method = RequestMethod.PUT)
	@ResponseBody
	public String changeItemPlan(@RequestBody  Map<String, Object> param){
		param.put("itemDm","LoginUser(Session)");
		itemService.modifyItemMinQty(param);
		
		if (((String)param.get("sendType")).equals("del")) {
			return "successDel";
		} else {
			return "successChange";
		}
	}
	
	
}
