package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import site.bucks.dto.Delivery;
import site.bucks.service.DeliveryService;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping(value = "/deliveryReq")
	public String getDeliveryReq(@ModelAttribute Delivery delivery, Model model) {
		delivery.setNowDeliveryState(40);
		model.addAttribute("deliveryReqList", deliveryService.getDeliveryList(delivery));
		return "delivery/delivery_req_list";
	}
	
	@RequestMapping(value = "/delReqConfirm")	
	public String modifyDeliveryReq(@ModelAttribute Delivery delivery, int deliverySeq) {
		delivery.setNowDeliveryState(40);
		deliveryService.modifyDelieveryState(deliverySeq);
		return "delivery/delivery_req_list";
		
		
	}

}
