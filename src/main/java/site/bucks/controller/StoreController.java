package site.bucks.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import site.bucks.dto.Hewon;
import site.bucks.dto.Store;
import site.bucks.service.HewonService;
import site.bucks.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService storeService;
	@Autowired
	HewonService hewonService;
	
//	占쌘★∽옙 AJAX 占쌘★∽옙 
//	占쏙옙占쏙옙占쏙옙占� 
	@RequestMapping(value = "/storeEnroll")
	public String storeEnroll() {
		return "store/store_enroll";
	}

	@RequestMapping(value = "/storeAdd",method = RequestMethod.POST)
	@ResponseBody
	public String storeAdd(@RequestBody Store store) {
		store.setStoreName(HtmlUtils.htmlEscape(store.getStoreName()));
		store.setStoreAddress(HtmlUtils.htmlEscape(store.getStoreAddress()));
		store.setStoreOwner(HtmlUtils.htmlEscape(store.getStoreOwner()));
		storeService.addStore(store);
		 return"success"; 
	}

//	占쏙옙占쏙옙 占쏙옙占싱듸옙 URL 占쌍소뤄옙 占쏙옙占쌨받억옙 STORE 占쏙옙占싱븝옙 占쏙옙占쏙옙占� 占쌔댐옙 占쏙옙占쏙옙占쏙옙 占싯삼옙占싹울옙 JSON 占쏙옙占승뤄옙 占쏙옙占쏙옙占싹댐옙 占쏙옙청처占쏙옙 占쌨소듸옙
	@RequestMapping(value = "/storeIdView/{storeId}", method = RequestMethod.GET)
	@ResponseBody
	public Store storeIdView(@PathVariable int storeId) {
		return storeService.getStoreId(storeId);
	}
		
	
//	占쏙옙占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/storeModify/{storeId}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	@ResponseBody
	public String storeModify(@RequestBody Store store, @PathVariable int storeId) {
//		占쏙옙 占쏙옙占쏙옙占쌘곤옙 占싣니띰옙占� 占쏙옙占쏙옙占쌀곤옙 占쌘듸옙占쌜쇽옙占쌔억옙占쏙옙 占쏙옙
		store.setStoreId(storeId);
		storeService.modifyStore(store);
		return "success";
	}
	
	  
	 
//	占쏙옙占쏙옙 占쏙옙황
	@RequestMapping(value = "/storeSta")
	public String storeSta(@ModelAttribute Store store, Model model) {
		model.addAttribute("storeList", storeService.getStoreList(store));
		return "store/store_sta";
	}
	

//	占쌘★∽옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌘★∽옙 
	@RequestMapping("/storeStaff") 
	public String storeStaff() {
		return "store/store_staff";
	}
	
	
//	占쌉시깍옙 占쏙옙占쏙옙占� AJAX占쏙옙 占쏙옙청
	@RequestMapping(value = "/storeStaffList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffList(@ModelAttribute Store store) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
	
//	@PathVariable 占쏙옙占쏙옙占쏙옙抉占쏙옙占� 占쏙옙占쏙옙臼占� URL 占쌍소뤄옙 占쏙옙占쌨듸옙 占쏙옙占쏙옙 占신곤옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/storeStaffList/{storeName}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffSearchList(@ModelAttribute Store store, @PathVariable String storeName) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String name=storeName;
		store.setStoreName(name);
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
//	占쌘★∽옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌘★∽옙
//	占쏙옙占쏙옙占쌘드를 占쏙옙占쌨받억옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쌨소듸옙 	
	@RequestMapping(value = "/storeOwner/{storeId}",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeOwner(@ModelAttribute Hewon hewon ,@PathVariable int storeId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		//System.out.println("hewonStId ="+storeId);
		returnMap.put("owner", hewonService.getHewonStIdList(storeId));
		
		return returnMap;
	}
	
}














