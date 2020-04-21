package site.bucks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	 @RequestMapping(value = "/delReqConfirm", method = RequestMethod.POST)
	 @ResponseBody
	 public String modifyDeliveryReq(@RequestBody Delivery delivery) {
	 delivery.setNowDeliveryState(40); 
	 deliveryService.modifyDelieveryState(delivery.getDeliverySeq()); 
	 return "redirect:delivery/delivery_req_list"; 
	 
	 }
	
	
	/*
	 * @RequestMapping(value = "/delReqConfirm", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String modifyDeliveryReq(@RequestParam(value = "list[]")
	 * List<Integer> deliveryList, @ModelAttribute Delivery delivery) {
	 * delivery.setNowDeliveryState(40); for(int deliverySeq:deliveryList) {
	 * System.out.println(deliverySeq);
	 * deliveryService.modifyDelieveryState(deliverySeq); } return
	 * "delivery/delivery_req_list"; }
	 */

}
