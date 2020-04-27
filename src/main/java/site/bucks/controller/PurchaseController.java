package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import site.bucks.dto.Purchase;
import site.bucks.service.ItemHistoryService;
import site.bucks.service.ItemService;
import site.bucks.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	ItemHistoryService itemHistoryService;
	  
	@Autowired
	ItemService itemService;
	
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
			itemHistoryService.updatedPOItemHist(purchaseSeq);	
		}
		
		
		
		return "success";
	}
	
	// 구매완료 처리 메소드 (일반 대리점) - 본사 재고와 상관 없음 / 배송에 insert 되어야 함 한줄만 
	// history에서 동일한 requestNum의 주문요청 확인(20) 상태의 개수와 
	// history에서 동일한 requestNum의 상태가 32 동일한 requestNum의 수와 purchase에서 완료된 
	@RequestMapping(value = "/purchaseComplete", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseComplete(@RequestParam(value = "list[]") List<Integer> purchase) {
		
		for (int purchaseSeq : purchase) {
			purchaseService.purchaseComplete(purchaseSeq);	
			itemHistoryService.updatedPOItemHist(purchaseSeq);
		}
		return "success";
	}
	
	@RequestMapping(value = "/inserDeliveryFromPurchase", method = RequestMethod.POST)
	@ResponseBody
	public String inserDeliveryFromPurchase(@RequestParam(value = "list[]") List<String> uniqueReqNums) {
		
		for (String requestNum : uniqueReqNums) {
			purchaseService.insertDeliveryFromPurchase(requestNum);
		}
		return "success";
	}
	
	
	
	
	// 구매완료 처리 메소드 (본사 자동/수동) - 본사 재고 증가 
		@RequestMapping(value = "/purchaseCompleteHQ", method = RequestMethod.POST)
		@ResponseBody
		public String purchaseCompleteHQ(@RequestParam(value = "list[]") List<Integer> purchaseHQ) {
			
			for (int purchaseSeq : purchaseHQ) {
				purchaseService.purchaseCompleteHQ(purchaseSeq);	
				itemHistoryService.updatedPOItemHist(purchaseSeq);
				purchaseService.updateQtyFromPurchase(purchaseSeq);
				
			}
			return "success";
		}
	
	// 구매취소 처리 메소드
	@RequestMapping(value = "/purchaseCancel", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseCancel(@RequestParam(value = "list[]") List<Integer> purchase) {
		
		for (int purchaseSeq : purchase) {
			purchaseService.purchaseCancel(purchaseSeq);	
			itemHistoryService.updatedPOItemHist(purchaseSeq);
		}
		return "success";
	}

	@RequestMapping(value = "/purchaseAdd", method = RequestMethod.GET)
	public String insertPurchaseOrder(){
		return "purchase/purchase_add";
	}
	
	@RequestMapping(value = "/purchaseAdd", method = RequestMethod.POST)
	@ResponseBody
	public String insertPurchaseOrder(@RequestBody List<Purchase> purchaseInputList){
		
		for(Purchase purchase:purchaseInputList) {
			itemHistoryService.newPOItemHist(purchase);
			purchaseService.insertPurchaseOrder(purchase);
			
			
		}
		
		
		
		return "success";
	}
	

}


