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
	
	@RequestMapping(value = "/purchaseList")
	public String getDisplayPurchaseList(){
		return "purchase/purchase_list";
	}
	
	
	// 추후 이용할거고 수정해
	@RequestMapping(value = "/purchaseList",method = RequestMethod.POST)
	public String getDisplayPurchaseList(@ModelAttribute Purchase purchase, Model model) {
		model.addAttribute("purchaseList", purchaseService.getPurchaseList(purchase));
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
