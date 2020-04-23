package site.bucks.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Sale;
import site.bucks.service.StoreItemService;

@Controller
@RequestMapping("/storeItem")
public class StoreItemController {
	
	@Autowired
	private StoreItemService storeItemService;
	
	
	
	
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

	
	
//	판매삭제
	/*
	 * @RequestMapping(value = "/sale_delete", method = RequestMethod.POST) public
	 * String sale_delete(Sale sale) { storeItemService.removeSale(sale); return
	 * "redirect:sale/sale_list"; }
	 */
	
	
	// 판매삭제
	@RequestMapping(value = "/saleCancel", method = RequestMethod.PUT)
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
	

}
