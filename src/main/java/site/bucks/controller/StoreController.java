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
public class StoreController {
	@Autowired
	StoreService storeService;
	@Autowired
	HewonService hewonService;
	
//	★★★ AJAX ★★★ 
//	지점등록 
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

//	지점 아이디를 URL 주소로 전달받아 STORE 테이블에 저장된 해당 지점을 검색하여 JSON 형태로 응답하는 요청처리 메소드
	@RequestMapping(value = "/storeIdView/{storeId}", method = RequestMethod.GET)
	@ResponseBody
	public Store storeIdView(@PathVariable int storeId) {
		return storeService.getStoreId(storeId);
	}
		
	
//	지점수정
	@RequestMapping(value = "/storeModify/{storeId}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	@ResponseBody
	public String storeModify(@RequestBody Store store, @PathVariable int storeId) {
//		★ 관리자가 아니라면 수정불가 코드작성해야함 ★
		store.setStoreId(storeId);
		storeService.modifyStore(store);
		return "success";
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

//	★★★ 지점 정보 ★★★ 
	@RequestMapping("/storeStaff") 
	public String storeStaff() {
		return "store/store_staff";
	}
	
	
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
	public Map<String, Object> storeOwner(@ModelAttribute Hewon hewon ,@PathVariable int storeId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.println("hewonStId ="+storeId);
		returnMap.put("owner", hewonService.getHewonStIdList(storeId));
		
		return returnMap;
	}
	
}














