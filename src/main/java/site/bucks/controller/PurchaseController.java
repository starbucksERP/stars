package site.bucks.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import site.bucks.dto.Purchase;
import site.bucks.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	// 구매현황 페이지 링크
	@RequestMapping(value = "/purchaseList",method = RequestMethod.GET)
	public String getDisplayPurchase() {
		return "purchase/purchase_list";
	}
	
	// 구매현황 페이지 기본 테이블 및 검색 출력 
	@RequestMapping(value = "/purchaseList",method = RequestMethod.POST)
	@ResponseBody
	public  List<Purchase> getPurchaseList(@RequestBody  Purchase purchase) {
		purchase.setItemNum(HtmlUtils.htmlEscape(purchase.getItemNum().trim()));
		purchase.setItemVendor(HtmlUtils.htmlEscape(purchase.getItemVendor().trim()));
		purchase.setPurchaseDate(HtmlUtils.htmlEscape(purchase.getPurchaseDate().trim()));
		purchase.setPurchaseDateTwo(HtmlUtils.htmlEscape(purchase.getPurchaseDateTwo()));
		purchase.setRequestNum(HtmlUtils.htmlEscape(purchase.getRequestNum().trim()));
		
		return purchaseService.getSearchPurchaseList(purchase);
	}
	
	// 구매요청 확인처리 메소드
	@RequestMapping(value = "/purchaseReqConfirm", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseReqConfirm(@RequestParam(value = "list[]") List<Integer> purchase) {
		
		for (int purchaseSeq : purchase) {
			purchaseService.purchaseReqConfirm(purchaseSeq);		
		}
		return "success";
	}
	
	// 구매완료 처리 메소드
	@RequestMapping(value = "/purchaseComplete", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseComplete(@RequestParam(value = "list[]") List<Integer> purchase) {
		
		for (int purchaseSeq : purchase) {
			purchaseService.purchaseComplete(purchaseSeq);		
		}
		return "success";
	}
	
	// 구매취소 처리 메소드
	@RequestMapping(value = "/purchaseCancel", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseCancel(@RequestParam(value = "list[]") List<Integer> purchase) {
		
		for (int purchaseSeq : purchase) {
			purchaseService.purchaseCancel(purchaseSeq);		
		}
		return "success";
	}
	

	@RequestMapping(value = "/purchasePlan")
	public String getDisplayPurchasePlan(){
		return "purchase/purchase_plan";
	}
	

	@RequestMapping(value = "/purchaseAdd", method = RequestMethod.GET)
	public String insertPurchaseOrder(){
		return "purchase/purchase_add";
	}
	
	@RequestMapping(value = "/purchaseAdd", method = RequestMethod.POST)
	@ResponseBody
	public String insertPurchaseOrder(@RequestBody List<Purchase> purchaseInputList){
		
		for(Purchase purchase:purchaseInputList) {
			purchaseService.insertPurchaseOrder(purchase);
		}
		
		return "success";
	}
	

}


