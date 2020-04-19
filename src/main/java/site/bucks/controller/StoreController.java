package site.bucks.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.HewonTest;
import site.bucks.dto.Store;
import site.bucks.service.HewonTestService;
import site.bucks.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	StoreService storeService;
	@Autowired
	HewonTestService hewonTestService;
	
//	★★★ AJAX ★★★ 
//	지점등록 및 수정
	@RequestMapping(value = "/storeEnroll")
	public String storeEnroll() {
		return "store/store_enroll";
	}
		
	
//	지점 현황
	@RequestMapping(value = "/storeSta")
	public String storeSta(@ModelAttribute Store store, Model model) {
		model.addAttribute("storeList", storeService.getStoreList(store));
		return "store/store_sta";
	}
	
	
	@RequestMapping(value = "/storeInfo")
	public String storeInfo() {
		return "store/store_info";
	}
	
	
	/*
	 * @RequestMapping(value = "/storeStaff", method = RequestMethod.GET) public
	 * String storeStaff(@ModelAttribute Store store, Model model) {
	 * model.addAttribute("storeList", storeService.getStoreList(store)); return
	 * "store/store_staff"; }
	 * 
	 */	
	
	
// *************************************** AJAX *************************************************

	@RequestMapping("/storeStaff") 
	public String storeStaff() {
		return "store/store_staff";
	}
	
	
//	★★★ 지점 정보 ★★★ 
//	게시글 목록을 AJAX로 요청
	@RequestMapping(value = "/storeStaffList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffList(@ModelAttribute Store store) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
	
//	@PathVariable 어노테이션을 사용하여 URL 주소로 전달된 값을 매개변수에 저장 가능
	@RequestMapping(value = "/storeStaffList/{storeName}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffSearchList(@ModelAttribute Store store, @PathVariable String storeName) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String name=storeName;
		store.setStoreName(name);
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
//	★★★ 점주 정보 ★★★
//	지점코드를 전달받아 점주정보를 가져오는 메소드 	
	@RequestMapping(value = "/storeOwner/{storeId}",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeOwner(@ModelAttribute HewonTest hewon ,@PathVariable int storeId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.println("hewonStId ="+storeId);
		returnMap.put("owner", hewonTestService.getHewonTestStId(storeId));
		
		return returnMap;
	}
	
}














