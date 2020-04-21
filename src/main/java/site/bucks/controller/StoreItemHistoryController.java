package site.bucks.controller;

import java.util.List;
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

import site.bucks.dto.Item;
import site.bucks.dto.OrderItem;
import site.bucks.service.StoreItemHistoryService;

@Controller
public class StoreItemHistoryController {
	@Autowired
	private StoreItemHistoryService storeItemHistoryService;
	
	@RequestMapping(value = "/storeReceipt")
	public String receiptList() {
		return "storeItem/receipt_list";
	}
	
	@RequestMapping(value = "/storeOrderReq")
	public String storeOrderReq() {
		return "storeItem/order_req";
	}
	
	/*
	-노가다-
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta(String historyDate1, String historyDate2, String storeHistorySeq, String itemName, String itemQty1, String itemQty2, Model model) {
		
		model.addAttribute("historyDate1", historyDate1);
		model.addAttribute("historyDate2", historyDate2);
		model.addAttribute("storeHistorySeq", storeHistorySeq);
		model.addAttribute("itemName", itemName);
		model.addAttribute("itemQty1", itemQty1);
		model.addAttribute("itemQty2", itemQty2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("historyDate1", historyDate1);
		map.put("historyDate2", historyDate2);
		map.put("storeHistorySeq", storeHistorySeq);
		map.put("itemName", itemName);
		map.put("itemQty1", itemQty1);
		map.put("itemQty2", itemQty2);
		
		model.addAttribute("storeReqStaList", storeItemHistoryService.getReciptSta(map));
		
		return "storeItem/order_status";
	}
	
//	지점 발주 요청 조회
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta(@ModelAttribute(value="storeOrderSta") AppliedOrderSta storeOrderSta, Model model) {
		
		model.addAttribute("storeOrderStaList", storeItemHistoryService.getReciptSta(storeOrderSta));
		return "storeItem/order_status";
	}
	
	-AJAX-
	
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta() {
		return "storeItem/order_status";
	}
	
	@RequestMapping(value = "/storeOrderStaList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String , Object> storeOrderStaList(@ModelAttribute AppliedOrderSta storeOrderSta) {
		Map<String, Object> returnMap= new HashMap<String, Object>();
		returnMap.put("sihList", storeItemHistoryService.getReciptSta(storeOrderSta));
		return returnMap;
	}
	
	@ModelAttribute("itemStateList")
	public List<String> itemStateList(){
		return Arrays.asList("발주요청","발주완료","배송중","입고완료");
	}

	*/
//	지점 발주 입력
	@RequestMapping(value = "/storeOrderInput",method = RequestMethod.GET)
	public String storeOrderInput() {
		return "storeItem/order_input";
	}
	
	@RequestMapping(value = "/storeOrderInput", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderInput(@RequestBody List<OrderItem> orderItemList) {
		
		for(OrderItem orderItem:orderItemList) {
			storeItemHistoryService.addRecipt(orderItem);
		}
		return "success";
	}
	
	
//	지점 발주 조회
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta(@ModelAttribute(value = "orderItem") OrderItem orderItem, Model model) {
		
		model.addAttribute("orderItemList", storeItemHistoryService.getReciptSta(orderItem));
		return "storeItem/order_status";
	}
	
	
//	지점 발주 입고처리
	@RequestMapping(value = "/checkStoreOrder", method = RequestMethod.POST)
	@ResponseBody
	public String checkStoreOrder(@RequestBody List<OrderItem> orderItemList) {
		storeItemHistoryService.modifyReceiptProcess(orderItemList);
		return "success";
	}
	
	
//	지점 발주 취소
	@RequestMapping(value = "/cancelStoreOrder", method = RequestMethod.POST)
	@ResponseBody
	public String cancelStoreOrder(@RequestBody List<OrderItem> orderItemList) {
		storeItemHistoryService.modifyCancelRecipt(orderItemList);
		return "success";
	}
	
	
	
//	아이템 카테고리로 찾아오기
	@RequestMapping(value = "/getItem", method = RequestMethod.POST)
	@ResponseBody
	public Map<String , Object> getItem(@RequestBody Item item) {
		return storeItemHistoryService.getItem(item);
	}
	
	
//	아이템 검색시 해당 item 정보 가져오기
	@RequestMapping(value = "/searchItem/{itemName}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchItem(@PathVariable String itemName) {
		return storeItemHistoryService.getItemName(itemName);
	}
	
	
	
	
}
