package site.bucks.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Sale;
import site.bucks.service.StoreItemService;

@Controller
public class StoreItemController {
	
	@Autowired
	private StoreItemService storeItemService;
	
//	�Ǹ� �Է�
	@RequestMapping(value = "/sale_record",method = RequestMethod.GET)
	public String sale_record() {
		return "sale/sale_record";
	}
	
	@RequestMapping(value = "/sale_record", method = RequestMethod.POST)
	@ResponseBody
	public String sale_record(@RequestBody List<Sale> saleList) {
		
		for(Sale sale:saleList) {
			
		}
		return "success";
	}
	

	
//	�Ǹ� ��ȸ
	@RequestMapping(value = "/sale_list")
	public String sale_list(@ModelAttribute Sale sale, Model model) {
		model.addAttribute("saleList", storeItemService.getSaleList(sale));
		return "sale/sale_list";
	}
	
	
//	��ǰ ��ȸ
	@RequestMapping(value = "/saleProduct", method = RequestMethod.GET)
	@ResponseBody
	public Map<String , Object> saleProduct(@ModelAttribute Sale sale) {
		return storeItemService.getSaleProductName(sale);
	}
	

}
