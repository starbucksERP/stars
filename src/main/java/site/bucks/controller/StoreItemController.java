package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.dto.Sale;
import site.bucks.dto.SaleCollection;
import site.bucks.service.StoreItemService;

@Controller
public class StoreItemController {
	
	@Autowired
	private StoreItemService storeItemService;
	
	
	@RequestMapping(value = "/sale_record", method =RequestMethod.POST)
	public String record(@ModelAttribute SaleCollection saleCollection) {
		
//		sale 전달받을때 필요한 값 => 상품명, 상품개수, 지점명 (정확한 값으로 전달받아야함)
		
//		@SuppressWarnings("unchecked")
//		List<Sale> list=(List<Sale>) saleCollection;
//		
//		for(Sale sale:list) {
//			storeItemService.saleRecord(sale);
//		}
//			
		return "sale/record";
	}

}
