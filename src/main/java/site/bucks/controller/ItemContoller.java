package site.bucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Item;

@Controller
public class ItemContoller {
	@RequestMapping(value = "/itemList")
	public String itemList() {
		return "item/item_list";
	}
	
	@RequestMapping(value = "window/itemEnroll", method = RequestMethod.GET)
	public String itemEnroll() {
		return "window/item_enroll";
	}
	@RequestMapping(value = "window/itemEnroll", method = RequestMethod.POST)
	public String itemEnroll(@ModelAttribute Item item) {
		// 재고등록명령
		return "window/item_enroll";
	}

}
