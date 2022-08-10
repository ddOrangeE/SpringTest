package com.soyaa.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.jsp.bo.SellerBO;
import com.soyaa.spring.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	// test01
	
	// 1번
	@GetMapping("/input")
	public String inputSeller() {
		
		return "jsp/sellerInput";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	// url 이 길어질 수 있기 때문에 post
	public String sellerResult(
			@RequestParam("nickname") String nickname
			, @RequestParam("url") String url
			, @RequestParam("temperature") double temperature
			) {
		
		int count = sellerBO.addSeller(nickname, url, temperature);
		
		if(count == 1) {
			return "입력성공";			
		} else {
			return "입력실패";
		}
	}
	
	
	
	// 2번
	@GetMapping("/lastSelect")
	public String sellectSeller(
			// int 는 null 을 저장하지 않는 기본 변수
			@RequestParam(value="id", required=false) Integer id
			, Model model) {
//		
//		// id 가 null 일 경우 가장 최근 사용자 가져와라
//		if(id == null) {
//			Seller seller = sellerBO.getSeller(); 			
//			model.addAttribute("seller", seller);
//			
//		} else {  // null 이 아닐 경우 id 기반으로 조회해라
//			Seller seller = sellerBO.getSellerbyId(id);
//			model.addAttribute("seller", seller);
//		} 

		
		// 중복된 코드 없애는 방법
		
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getSeller(); 			
			
			
		} else {  
			seller = sellerBO.getSellerbyId(id);
		} 
		model.addAttribute("seller", seller);

		
		return "jsp/sellerInfo";
	}
	
	
	// 만약에 만들어져 있는 jsp 를 재활용하는 과정에서 새로운 model 을 저장해야한다면, jsp에서 어떠한 key로 사용되고 있는지 jsp를 먼저 확인해야한다!!
	
	// 기능마다 jsp 를 하나씩 따로 만드는 것이 아니라 하나의 jsp를 활용 : 종속성 (controller - jsp) 
	// 이것이 mvc 를 쓰는 이유!!
	
	// controller 의 기능마다 model은 따로 가지고 있지만 model의 사용법은 같기 때문에 하나의 jsp 를 사용 가능!!
	
	// 개발자들은 똑같은 코드가 있는 것을 두려워한다 : 유지보스가 힘들어서
	
}
