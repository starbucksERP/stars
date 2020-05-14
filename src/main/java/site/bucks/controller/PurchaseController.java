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
import site.bucks.service.OrderItemService;
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
	
	@Autowired
	OrderItemService orderItemService;
	
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
	public String purchaseReqConfirm(@RequestParam(value = "list[]") List<String> purchase) {
		
		for (String requestNum : purchase) {
			purchaseService.purchaseReqConfirm(requestNum);
			itemHistoryService.updatedPOItemHist(requestNum);	
			orderItemService.updateOrderStateFromPurchase(requestNum);
			
		}
		
		return "success";
	}
	
	// 구매완료 처리 메소드 (일반 대리점) 
	@RequestMapping(value = "/purchaseComplete", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseComplete(@RequestParam(value = "list[]") List<String> purchase) {
		
		for (String requestNum : purchase) {
			purchaseService.purchaseComplete(requestNum);	
			itemHistoryService.updatedPOItemHist(requestNum);
			orderItemService.updateOrderStateFromPurchase(requestNum);
		}
		return "success";
	}
	
	
	// 대리점의 구매요청이 완료처리되어 배송요청으로 insert 
	@RequestMapping(value = "/insertDeliveryFromPurchase", method = RequestMethod.POST)
	@ResponseBody
	public String inserDeliveryFromPurchase(@RequestParam(value = "list[]") List<String> uniqueReqNums) {
		
		for (String requestNum : uniqueReqNums) {
			purchaseService.insertDeliveryFromPurchase(requestNum);
			orderItemService.updateOrderStateFromPurchase(requestNum);
			
			
		}
		return "success";
	}

	// 구매완료 처리 메소드 (본사 자동/수동)
		@RequestMapping(value = "/purchaseCompleteHQ", method = RequestMethod.POST)
		@ResponseBody
		public String purchaseCompleteHQ(@RequestParam(value = "list[]") List<String> purchaseHQ) {
			
			for (String requestNum : purchaseHQ) {
				purchaseService.purchaseCompleteHQ(requestNum);	
				itemHistoryService.updatedPOItemHist(requestNum); 
				
			}
			return "success";
		}
	
	// 본사의 구매요청이 완료 처리되면 재고 아이템 증가 - 본사 재고 증가
		@RequestMapping(value = "/updateQtyFromPurchase", method = RequestMethod.POST)
		@ResponseBody
		public String updateQtyFromPurchase(@RequestParam(value = "list[]") List<Integer> purchaseHQSeqList) {
			
			for (int purchaseSeq : purchaseHQSeqList) {
				purchaseService.updateQtyFromPurchase(purchaseSeq);
			}
			return "success";
		}
		
		
		
	// 구매취소 처리 메소드
	@RequestMapping(value = "/purchaseCancel", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseCancel(@RequestParam(value = "list[]") List<String> purchase) {
		
		for (String requestNum : purchase) {
			purchaseService.purchaseCancel(requestNum);	
			itemHistoryService.updatedPOItemHist(requestNum);
			orderItemService.updateOrderStateFromPurchase(requestNum);
		}
		return "success";
	}

	
	@RequestMapping(value = "/purchaseAdd", method = RequestMethod.GET)
	public String insertPurchaseOrder(){
		return "purchase/purchase_add";
	}
	
	// 구매 입력을 위한 메소드 
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


