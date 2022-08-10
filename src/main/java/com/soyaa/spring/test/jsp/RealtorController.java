package com.soyaa.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soyaa.spring.test.jsp.bo.RealtorBO;
import com.soyaa.spring.test.jsp.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {

	// test02
	
	@Autowired
	private RealtorBO realtorBO;
	
	// 공인중개사 입력 페이지
	@GetMapping("/input")
	public String realtorInput() {
		return "jsp/realtorInput";
	}
	
	// 공인중개사 정보 저장하는
	@PostMapping("/insert")
	public String addRealtorByObject(
			
			// @ModelAttribute 객체로 받는 방법 : @RequestParam 대신 사용 가능 -> 객체의 멤버변수 이름과 일치하면 전달 받기 때문에 input에 name 속성을 객체의  멤버변수 이름과 일치시켜주어야 한다
			// @ModelAttribute 를 이용해서 객체를 생성하여 이 객체를 파라미터 형태로 전달까지 해준다!
			@ModelAttribute Realtor realtor
			, Model model) {  // jsp 에서 값을 꺼내쓸 수 있게 해주는 것 : Model model
		
		realtorBO.addRealtorByObject(realtor);
		
		model.addAttribute("realtor", realtor); // "" 따옴표 안의 이름으로, realtor 객체를 쓸 수 있다!!(jsp에서)
		
		return "jsp/realtorInfo";
		
	}
	
}
