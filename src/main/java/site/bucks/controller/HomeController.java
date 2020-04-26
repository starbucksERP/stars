package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.OrderNum;
import site.bucks.service.StoreItemHistoryService;

@Controller
public class HomeController {
	@Autowired
	private StoreItemHistoryService storeItemHistoryService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template() {
		return "home";
	}
	
//	숫자 출력(주문된)
	@RequestMapping(value = "**/upupNum", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderNum> upupNum() {
		return storeItemHistoryService.getNumNum();
	}
	
//  숫자초기화
	@RequestMapping(value = "**/upupNumDel", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderNum> upupNumDel(){
		storeItemHistoryService.modifyNumNum();
		return storeItemHistoryService.getNumNum();
	}
	
}











