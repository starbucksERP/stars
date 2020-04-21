package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import site.bucks.dto.Delivery;
import site.bucks.service.DeliveryService;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	// >>>>>>>>>>>>>>>>>>>>>>>>> 배송요청확인 페이지에서 사용할 메소드 시작 
	
	// 1. 배송요청확인 페이지의 기본 테이블 출력을 위해 사용되는 select 메소드  
	@RequestMapping(value = "/deliveryReq")
	public String getDeliveryReq(@ModelAttribute Delivery delivery, Model model) {
		delivery.setNowDeliveryState(40);
		model.addAttribute("deliveryReqList", deliveryService.getDeliveryList(delivery));
		return "delivery/delivery_req_list";
	}
	
	
	// 2. 배송요청확인 페이지의 요청확인처리 버튼을 눌렀을때 사용되는 update 메소드 
	  @RequestMapping(value = "/delReqConfirm", method = RequestMethod.POST)
	  @ResponseBody 
	  public String modifyDeliveryReq(@RequestParam(value = "list[]") 
	  List<Integer> deliveryList ) {
		  
		 for(int deliverySeq:deliveryList) {
			 deliveryService.modifyDeliveryReq(deliverySeq);
		 }	  
	  return"redirect:delivery/delivery_req_list"; 
	  }
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송요청확인 페이지에서 사용할 메소드 종료 
	  
	  
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송현황조회 페이지에서 사용할 메소드 시작 
	  
	  // 1. 배송현황조회 페이지의 기본 테이블 출력을 위해 사용되는 select 메소드 
	  @RequestMapping(value = "/deliveryList")
		public String getDeliveryReady(@ModelAttribute Delivery delivery, Model model) {
		   delivery.setNowDeliveryState(50);
		   model.addAttribute("deliveryReadyList", deliveryService.getDeliveryList(delivery));
			return "delivery/delivery_list";
		}
	  
	  // 2. 배송현황조회 페이지에서 배송시작 버튼을 눌렀을때 사용되는 update 메소드 
	  @RequestMapping(value = "/deliveryStart", method = RequestMethod.POST)
	  @ResponseBody 
	  public String modifyDelivery(@RequestParam(value = "list[]") 
	  List<Integer> deliveryList ) {
		  System.out.println("일단 여기까지 오는데 성공했다.");
		  System.out.println("승인번호: = "+deliveryList );			
		  
		  for(int deliverySeq:deliveryList) { 
			  System.out.println(deliverySeq);
			  
			  deliveryService.modifyDeliveryReady(deliverySeq); 
			  }
		   
	  return"redirect:delivery/delivery_list"; 
	  }
	  
	  
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송현황조회 페이지에서 사용할 메소드 종료 
		
	 

}
























