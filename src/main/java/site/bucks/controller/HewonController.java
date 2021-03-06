package site.bucks.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.bucks.dto.Hewon;
import site.bucks.exception.HewonExistsException;
import site.bucks.exception.HewonNotFoundException;
import site.bucks.exception.LoginAuthFailException;
import site.bucks.service.HewonService;
import site.bucks.service.OrderItemService;
import site.bucks.service.PurchaseService;

@Controller
@RequestMapping("/hewon")
public class HewonController {
	@Autowired
	private HewonService hewonService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private OrderItemService orderItemService;

	//인터셉터를 이용하여 관리자가 아닌 사용자가 요청한 경우 요청처리 메소드가 호출되지 않도록 설정
	//인터셉터(Interceptor) : Front Controller에 의해 요청처리 메소드 호출 전 필요한 명령을 실행하는 기능 - 권한 처리 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "hewon/hewon_write";
	}
	
	//Service 클래스의 메소드 실행시 예외가 발생될 경우 발생된 예외를 처리하지 않고 Front Controller에게 전달
	// => Front Controller는 예외처리 메소드(ExceptionHandler)를 호출하여 예외 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute Hewon hewon) throws HewonExistsException {
		hewonService.addHewon(hewon);
		return "redirect:/hewon/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "hewon/hewon_login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Hewon hewon, HttpSession session) throws LoginAuthFailException, HewonNotFoundException {
		//인증 실패 : 예외 발생
		hewonService.loginAuth(hewon);
		
		//인증 성공 : 세션에 인증정보(회원정보) 저장 - 권한 
		Hewon loginHewon=hewonService.getHewon(hewon.getHewonId());
		session.setAttribute("loginHewon", loginHewon);
		String today= new SimpleDateFormat("yyyy-MM-dd").format(new Date());

		// 자동주문호출
		if(loginHewon.getHewonGrade().equals("9")) {
			boolean possible=purchaseService.getPurchseByPlan(today).isEmpty();
			if(possible) {
				orderItemService.addOrderByMinQty(today, loginHewon.getHewonName());
			} else {
				System.out.println("Already done.");
			}
		}
		
		if(session.getAttribute("destURI")!=null) {
			String destURI=(String)session.getAttribute("destURI");
			session.removeAttribute("destURI");
			return "redirect:"+destURI;
		}
		
		
		return "hewon/hewon_login";
	}

	@RequestMapping("/logout") 
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/hewon/login";
	}
	
	
	//인터셉터를 이용하여 로그인 사용자가 아닌 경우 요청처리 메소드가 호출되지 않도록 설정
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("hewonList", hewonService.getHewonList());
		return "hewon/hewon_list";
	}
	
	//인터셉터를 이용하여 로그인 사용자가 아닌 경우 요청처리 메소드가 호출되지 않도록 설정
	@RequestMapping("/view")
	public String view(@RequestParam String hewonId, Model model) throws HewonNotFoundException {
		model.addAttribute("hewon", hewonService.getHewon(hewonId));
		return "hewon/hewon_view";
	}
	
	//인터셉터를 이용하여 로그인 사용자가 아닌 경우 요청처리 메소드가 호출되지 않도록 설정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam String hewonId, Model model, HttpSession session) throws HewonNotFoundException {
		//인터셉터 이용하여 처리 가능
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		if(!loginHewon.getHewonGrade().equals("9") && !loginHewon.getHewonId().equals(hewonId)) {
			return "hewon/hewon_error";
		}
		
		model.addAttribute("hewon", hewonService.getHewon(hewonId));
		return "hewon/hewon_modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute Hewon hewon, HttpSession session) throws HewonNotFoundException {
		hewonService.modifyHewon(hewon);
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		
		if(loginHewon.getHewonId().equals(hewon.getHewonId())) {
			session.setAttribute("loginHewon", hewonService.getHewon(hewon.getHewonId()));
		}
		
		return "redirect:/hewon/view?hewonId="+hewon.getHewonId();
	}

	//인터셉터를 이용하여 관리자가 아닌 사용자가 요청한 경우 요청처리 메소드가 호출되지 않도록 설정
	@RequestMapping("/remove")
	public String remove(@RequestParam String hewonId, HttpSession session) throws HewonNotFoundException {
		hewonService.removeHewon(hewonId);
		Hewon loginHewon=(Hewon)session.getAttribute("loginHewon");
		if(loginHewon.getHewonId().equals(hewonId)) {
			return "redirect:/logout";
		} else {
			return "redirect:/list";
		}
	}
	
	//@ExceptionHandler : Controller 클래스의 요청처리 메소드에서 예외가 
	//발생된 경우 예외를 처리하기 위한 메소드를 설정
	// => value 속성에 예외 클래스(Clazz)를 속성값으로 설정
	//예외처리 관련 정보를 예외처리 메소드의 매개변수를 선언하여 제공받아 사용
	@ExceptionHandler(HewonExistsException.class)
	public String exceptionHandler(HewonExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("hewon", exception.getHewon());
		return "hewon/hewon_write";
	}
	
	@ExceptionHandler(LoginAuthFailException.class)
	public String exceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("hewonId", exception.getHewonId());
		return "hewon/hewon_login";
	}
	
	/*
	//Exception를 처리하는 예외처리 메소드가 존재할 경우 생략 가능
	@ExceptionHandler(HewonNotFoundException.class)
	public String exceptionHandler(HewonNotFoundException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "Hewon/hewon_error";
	}
	*/
	
	/*
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception exception) {
		exception.printStackTrace();
		return "Hewon/hewon_error";
	}
	*/
	
	
}
