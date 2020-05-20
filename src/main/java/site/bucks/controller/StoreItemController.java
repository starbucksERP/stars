package site.bucks.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Delivery;
import site.bucks.dto.Hewon;
import site.bucks.dto.Item;
import site.bucks.dto.ProductRecipe;
import site.bucks.dto.Sale;
import site.bucks.dto.StoreItem;
import site.bucks.exception.HewonNotFoundException;
import site.bucks.service.DeliveryService;
import site.bucks.service.StoreItemService;

@Controller
@RequestMapping("/storeItem")
public class StoreItemController {
	
	@Autowired
	private StoreItemService storeItemService;
	@Autowired
	private DeliveryService deliveryService;
	
	
	
//	판매 기록
	@RequestMapping(value = "/sale_record",method = RequestMethod.GET)
	public String sale_record() {
		return "sale/sale_record";
	}
	
	@RequestMapping(value = "/sale_record", method = RequestMethod.POST)
	@ResponseBody
	public String sale_record(@RequestBody List<Sale> saleList) {
		
		for(Sale sale:saleList) {
			storeItemService.addSale(sale);
		}
		return "success";
	}

	
	
	// 판매삭제
	@RequestMapping(value = "/saleCancel", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderReqConfirm(@RequestBody Sale sale) {
		storeItemService.removeSale(sale);
		return "success";
	}
	
	
	// 판매조회
	@RequestMapping(value = "/saleList", method = RequestMethod.GET)
	public String storeOrderRequestList() {
		return "sale/sale_list";
	}
	
	// 판매조회
	@RequestMapping(value = "/saleList", method = RequestMethod.POST)
	@ResponseBody
	public List<Sale> storeOrderRequestList(@RequestBody Sale sale) { 
		return storeItemService.getSaleList(sale);
	}
	
	
//	판매 상품 카테고리검색  	saleProductCategory
	@RequestMapping(value = "/saleProduct/{itemNum}", method = RequestMethod.GET)
	@ResponseBody
	public List<ProductRecipe> getsaleCategory(@PathVariable String itemNum) {
		return storeItemService.getProductCategory(itemNum);
	}
	
//	판매 상품  검색 	saleProductName
	@RequestMapping(value = "/saleProductName/{itemNum}", method = RequestMethod.GET)
	@ResponseBody
	public ProductRecipe getsaleProductName(@PathVariable String itemNum) {
		return storeItemService.getProductName2(itemNum);
	}
	
	
	
	
	
	
	
	
	
// 재고 현황
	 @RequestMapping(value = "/itemList") public String itemList() {
		 return "storeItem/item_list"; 
	 }
	 
//	  재고현황 다중검색
	 @RequestMapping(value = "/itemList", method = RequestMethod.POST)
	 @ResponseBody 
	 public List<StoreItem> storeItemList(@RequestBody StoreItem storeItem) { 
		 return storeItemService.getStoreItemList(storeItem); 
	 }
	 
//	 재고 검색
	@RequestMapping(value = "/getItem", method = RequestMethod.POST)
	@ResponseBody
	public StoreItem getStoreItem(@RequestBody StoreItem storeItem) {
		return storeItemService.getStoreItem(storeItem);
	}
	
//	재고삭제
	@RequestMapping(value = "/itemDelete", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String storeItemDelete(@RequestBody StoreItem storeItem) {
		storeItemService.removeStoreItem(storeItem);
		return "success";
	}
	
//	재고 수정
	@RequestMapping(value = "/itemModify", method = {RequestMethod.PUT, RequestMethod.PATCH })
	@ResponseBody
	public String storeItemModify(@RequestBody StoreItem storeItem) {
		storeItemService.modifyStoreItem(storeItem);
		return "success";
	}
	
	
	
	
	
	
	
	
	
//	배송조회
	@RequestMapping(value = "/deliveryList", method = RequestMethod.GET)
	public String getDisplayDelReadyList(@ModelAttribute Delivery delivery, Model model, HttpSession session) throws HewonNotFoundException  {
		
		 Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		 
		 if(!loginHewon.getHewonGrade().equals("9")) {
			 delivery.setStoreId(loginHewon.getHewonStId());
		 }
		
		model.addAttribute("delReadyList", deliveryService.getDisplayDelReadyList(delivery));
		return "storeItem/delivery_list";
	}

	// 2. 배송현황조회 페이지의 검색용 	
	@RequestMapping(value = "/deliveryList", method = RequestMethod.POST)
	public String getSearchDelReadyList(@ModelAttribute Delivery delivery, Model model,  HttpSession session) throws HewonNotFoundException  {
		
		 Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		 if(!loginHewon.getHewonGrade().equals("9")) {
			 delivery.setStoreId(loginHewon.getHewonStId()); 
		 }
		
		model.addAttribute("delReadyList", deliveryService.getSearchDelReadyList(delivery));
		return "storeItem/delivery_list";
	}
	
	
	

}
