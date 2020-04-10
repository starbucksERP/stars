package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.bucks.service.StoreItemService;

@Controller
public class StoreItemController {
	
	@Autowired
	private StoreItemService storeItemService;
	
	
	@RequestMapping(value = "/sale_record", method =RequestMethod.POST)
	public String record() {
		
//			Sale saleProduct=saleList.get(i);
//			Sale saleQty=saleList.get(i);
		
//			storeItemService.saleRecord(sale);
			
			
		return "store/enroll";
	}

}
