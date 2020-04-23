package site.bucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// 1. 배송요청확인 페이지의 기본테이블 출력 및 단일검색 출력용 (JSTL)
	
	@RequestMapping(value = "/deliveryReq")
	public String getdelReqList(@ModelAttribute Delivery delivery, Model model) {
		delivery.setNowDeliveryState(40);
		model.addAttribute("delReqList", deliveryService.getDelReqList(delivery));
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
	  
	  
		// 1. 배송요청확인 페이지의 링크(핸들바스)  
		/*
		@RequestMapping("/deliveryReq") 
		public String delReqList() {
			return "delivery/delivery_req_list";
		}*/
		
		/* 
		//2.핸들바스 배송요청페이지 리스트 출력용
		@RequestMapping(value = "/deliveryReqList", method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> getDeliveryReq(@ModelAttribute Delivery delivery) {
			Map<String, Object>delReqListMap = new HashMap<String, Object>();
			delivery.setNowDeliveryState(40);
			delReqListMap.put("deliveryReqList", deliveryService.getDelReqList(delivery));
			return delReqListMap;
		}*/
	  
	  /*
  	  // 4. 배송요청확인 페이지의 단일검색을 위한 select 메소드  (핸들바스)
	  @RequestMapping(value = "/deliveryReqSearch", method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> deliveryReqSearch(@RequestBody Delivery delivery) {

		  Map<String, Object>searchMap = new HashMap<String, Object>();
	      delivery.setNowDeliveryState(40);   
	      searchMap.put("reqSearchList", deliveryService.getDelReqList(delivery)); 
	      return searchMap;
	     
	   }*/
	  
	  
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송요청확인 페이지에서 사용할 메소드 종료 
	  
	  
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송현황조회 페이지에서 사용할 메소드 시작 
	  
	  
	  // 1. 배송요청확인 페이지의 기본테이블 출력 및 단일검색 출력용 (JSTL)
		
		@RequestMapping(value = "/deliveryList")
		public String getDeliveryReady(@ModelAttribute Delivery delivery, Model model) {
			System.out.println("getDeliveryReady");
			delivery.setNowDeliveryState(50);
			model.addAttribute("delReadyList", deliveryService.getDelReadyList(delivery));
			return "delivery/delivery_list";
		}
		
	  
	
	  
	  // 2. 배송현황조회 페이지에서 배송시작 버튼을 눌렀을때 사용되는 update 메소드 
	  @RequestMapping(value = "/deliveryStart", method = RequestMethod.POST)
	  @ResponseBody 
	  public String modifyDelivery(@RequestParam(value = "list[]") 
	  List<Integer> deliveryList ) {
		  for(int deliverySeq:deliveryList) { 
			  System.out.println(deliverySeq);
			  
			  deliveryService.modifyDeliveryReady(deliverySeq); 
			  }
		   
	  return"redirect:delivery/delivery_list"; 
	  }
	  

		  
		  /*
		  // 1. 배송현황조회 페이지의 링크 (핸들바스)
		  @RequestMapping("/deliveryList") 
			public String delReadyList() {
				return "delivery/delivery_list";
			}
		  
		  // 1. 배송현황조회 페이지의 기본 테이블 출력을 위해 사용되는 select 메소드 (핸들바스)
		  @RequestMapping(value = "/deliveryReadyList")
		  @ResponseBody
		  public Map<String, Object> getDeliveryReady(@ModelAttribute Delivery delivery) {
			  delivery.setNowDeliveryState(50);
			  Map<String, Object>delReadyListMap = new HashMap<String, Object>();
			   delReadyListMap.put("deliveryReadyList", deliveryService.getDelReadyList(delivery));
				return delReadyListMap;
			}
			
		// 4. 배송현황조회 페이지의 다중검색을 위한 select 메소드  
		  @RequestMapping(value = "/deliveryReadySearch", method = RequestMethod.POST)
		   @ResponseBody
		   public Map<String, Object> deliveryReadySearch(@RequestBody Delivery delivery) {
			  delivery.setNowDeliveryState(10);
			  Map<String, Object>searchMap = new HashMap<String, Object>();
		      searchMap.put("readySearchList", deliveryService.getDelReadyList(delivery));
		    
		      return searchMap;
		     
		   }	
			*/		  
	  
	  // >>>>>>>>>>>>>>>>>>>>>>>>> 배송현황조회 페이지에서 사용할 메소드 종료 
		
	 

}
























