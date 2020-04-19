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
	
//	�ڡڡ� AJAX �ڡڡ� 
//	������� �� ����
	@RequestMapping(value = "/storeEnroll")
	public String storeEnroll() {
		return "store/store_enroll";
	}
		
	
//	���� ��Ȳ
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
	
	
//	�ڡڡ� ���� ���� �ڡڡ� 
//	�Խñ� ����� AJAX�� ��û
	@RequestMapping(value = "/storeStaffList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffList(@ModelAttribute Store store) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
	
//	@PathVariable ������̼��� ����Ͽ� URL �ּҷ� ���޵� ���� �Ű������� ���� ����
	@RequestMapping(value = "/storeStaffList/{storeName}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeStaffSearchList(@ModelAttribute Store store, @PathVariable String storeName) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String name=storeName;
		store.setStoreName(name);
		returnMap.put("storeList", storeService.getStoreList(store));
		return returnMap;
	}
	
//	�ڡڡ� ���� ���� �ڡڡ�
//	�����ڵ带 ���޹޾� ���������� �������� �޼ҵ� 	
	@RequestMapping(value = "/storeOwner/{storeId}",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> storeOwner(@ModelAttribute HewonTest hewon ,@PathVariable int storeId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.println("hewonStId ="+storeId);
		returnMap.put("owner", hewonTestService.getHewonTestStId(storeId));
		
		return returnMap;
	}
	
}














