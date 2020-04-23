package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Purchase;
import site.bucks.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	// 구매현황 페이지 기본 테이블 출력 
	@RequestMapping(value = "/purchaseList",method = RequestMethod.GET)
	public String getDisplayPurchaseList(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getDisplayPurchaseList(purchase));
		return "purchase/purchase_list";
	}
	

	@RequestMapping(value = "/purchasePlan")
	public String getDisplayPurchasePlan(){
		return "purchase/purchase_plan";
	}
	

	@RequestMapping(value = "/purchaseAdd")
	public String getDisplayPurchaseAdd(){
		return "purchase/purchase_add";
	}
	

}
