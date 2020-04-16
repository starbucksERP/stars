package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Store;
import site.bucks.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	StoreService storeService;
	
//	지점및 점주관리
	@RequestMapping(value = "/storeEnroll")
	public String storeEnroll() {
		return "store/store_enroll";
	}
	
	@RequestMapping(value = "/storeSta")
	public String display(@ModelAttribute Store store, Model model) {
		model.addAttribute("storeList", storeService.getStoreList(store));
		return "store/store_sta";
	}
	
	@RequestMapping(value = "/storeInfo")
	public String storeInfo() {
		return "store/store_info";
	}

	@RequestMapping(value = "/storeStaff")
	public String storeStaff() {
		return "store/store_staff";
	}
	
	
}
