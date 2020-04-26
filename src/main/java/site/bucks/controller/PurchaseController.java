package site.bucks.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Purchase;
import site.bucks.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	// 구매현황 페이지 기본 테이블 출력 
	/*
	@RequestMapping(value = "/purchaseList",method = RequestMethod.GET)
	public String getDisplayPurchaseList(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getDisplayPurchaseList(purchase));
		return "purchase/purchase_list";
	}*/
	
	@RequestMapping(value = "/purchaseList")
	public String getPurchase() {
		return "purchase/purchase_list";
	}
	
	@RequestMapping(value = "/pList",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getDisplayPurchaseList(@ModelAttribute Purchase purchase) {
		Map<String, Object> purchaseListMap = new HashMap<String, Object>();
		purchaseListMap.put("purchaseResult", purchaseService.getDisplayPurchaseList(purchase));
		return purchaseListMap;
	}
	
	
	@RequestMapping(value = "/futureList",method = RequestMethod.GET)
	public String getDisplayFutureList(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getDisplayFutureList(purchase));
		return "purchase/purchase_list";
	}
	
	@RequestMapping(value = "/purchaseReq",method = RequestMethod.GET)
	public String getDisplayPurchaseReq(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getDisplayPurchaseReq(purchase));
		return "purchase/purchase_list";
	}
	
	@RequestMapping(value = "/inProcess",method = RequestMethod.GET)
	public String getDisplayInProcess(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getDisplayInProcess(purchase));
		return "purchase/purchase_list";
	}

	@RequestMapping(value = "/purchaseAdd")
	public String getDisplayPurchaseAdd(){
		return "purchase/purchase_add";
	}
	

}


