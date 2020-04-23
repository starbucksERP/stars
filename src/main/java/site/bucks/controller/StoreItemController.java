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

import site.bucks.dto.Sale;
import site.bucks.service.StoreItemService;

@Controller
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
	@RequestMapping(value = "/sale_delete", method = RequestMethod.POST)
	public String sale_delete(Sale sale) {
		storeItemService.removeSale(sale);
		return "redirect:/sale_list";
	}
	
	
	
//	판매조회
	@RequestMapping(value = "/sale_list")
	public String sale_list(@ModelAttribute Sale sale, Model model) {
		model.addAttribute("saleList", storeItemService.getSaleList(sale));
		return "sale/sale_list";
	}
	
	
	
//	카테고리 별 검색 후 상품 조회
	@RequestMapping(value = "/saleProduct", method = RequestMethod.POST)
	@ResponseBody
	public Map<String , Object> saleProduct(@RequestBody Sale sale) {
		return storeItemService.getSaleProductName(sale);
	}
	
//	판매상품의 가격 검색 
	@RequestMapping(value = "/searchProduct/{saleProduct}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchProduct(@PathVariable String saleProduct) {
		return storeItemService.getSaleProduct(saleProduct);
	}
	

}
