package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	// 수정필요------
	@RequestMapping(value = "window/itemEnroll", method = RequestMethod.GET)
	public String itemEnroll() {
		return "window/item_enroll";
	}
	@RequestMapping(value = "window/itemEnroll", method = RequestMethod.POST)
	public String itemEnroll(@ModelAttribute Item item) {
		// 재고등록명령
		return "window/item_enroll";
	}	
	//-----------------------------
	
	
	@RequestMapping(value = "/product")
	public String product() {
		return "item/product_list";
	}
	
	@RequestMapping(value = "/productEnroll", method = RequestMethod.POST)
	@ResponseBody
	public String productEnroll(@RequestBody Item item) {
		// 로그인기능 추가시 : LoginUser Name>> setDM해주고 >> insertProduct Mapper #{itemDm}처리
		item.setItemName(HtmlUtils.htmlEscape(item.getItemName()));
		item.setItemVendor(HtmlUtils.htmlEscape(item.getItemVendor()));
		itemService.addProduct(item);
		return "success";
	}
}
