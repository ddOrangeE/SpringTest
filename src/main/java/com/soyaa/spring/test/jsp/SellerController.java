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
			Model model
			, @RequestParam(value="id", required=false) Integer id) {
		
		if(id == null) {
			Seller seller = sellerBO.getSeller(); 			
			model.addAttribute("seller", seller);
		} else {
			Seller seller = sellerBO.getSellerbyId(id);
			model.addAttribute("seller", seller);
		} 
		
		
		return "jsp/sellerInfo";
	}
	
	
	
}
