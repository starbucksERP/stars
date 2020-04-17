package site.bucks.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.AppliedOrderSta;
import site.bucks.dto.StoreItemHistory;
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
	*/
	
//	지점 발주 요청 조회
	@RequestMapping(value = "/storeOrderSta")
	public String storeOrderSta(@ModelAttribute(value="storeOrderSta") AppliedOrderSta storeOrderSta, Model model) {
		
		model.addAttribute("storeOrderStaList", storeItemHistoryService.getReciptSta(storeOrderSta));
		return "storeItem/order_status";
	}
	
	@ModelAttribute("itemStateList")
	public List<String> itemStateList(){
		return Arrays.asList("발주요청","발주완료","배송중","입고완료");
	}

	
	
//	지점 발주 입력
	@RequestMapping(value = "/storeOrderInput",method = RequestMethod.GET)
	public String storeOrderInput() {
		return "storeItem/order_input";
	}
	
	@RequestMapping(value = "/storeOrderInput", method = RequestMethod.POST)
	@ResponseBody
	public String storeOrderInput(@RequestBody List<StoreItemHistory> sihList) {
		
		for(StoreItemHistory sih:sihList) {
			storeItemHistoryService.addRecipt(sih);
		}
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
