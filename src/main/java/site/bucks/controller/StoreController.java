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
	
//	�ڡڡ� AJAX �ڡڡ� 
//	������� 
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

//	���� ���̵� URL �ּҷ� ���޹޾� STORE ���̺� ����� �ش� ������ �˻��Ͽ� JSON ���·� �����ϴ� ��ûó�� �޼ҵ�
	@RequestMapping(value = "/storeIdView/{storeId}", method = RequestMethod.GET)
	@ResponseBody
	public Store storeIdView(@PathVariable int storeId) {
		return storeService.getStoreId(storeId);
	}
		
	
//	��������
	@RequestMapping(value = "/storeModify/{storeId}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	@ResponseBody
	public String storeModify(@RequestBody Store store, @PathVariable int storeId) {
//		�� �����ڰ� �ƴ϶�� �����Ұ� �ڵ��ۼ��ؾ��� ��
		store.setStoreId(storeId);
		storeService.modifyStore(store);
		return "success";
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

//	�ڡڡ� ���� ���� �ڡڡ� 
	@RequestMapping("/storeStaff") 
	public String storeStaff() {
		return "store/store_staff";
	}
	
	
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
	public Map<String, Object> storeOwner(@ModelAttribute Hewon hewon ,@PathVariable int storeId) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.println("hewonStId ="+storeId);
		returnMap.put("owner", hewonService.getHewonStIdList(storeId));
		
		return returnMap;
	}
	
}














