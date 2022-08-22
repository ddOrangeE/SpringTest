package com.soyaa.spring.test.ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PansionController {

	@GetMapping("/ajax/pension/header")
	public String pension() {
		return "ajax/pension/header";
	}
	
	
	@GetMapping("/ajax/pension/main")
	public String pensionMain() {
		return "ajax/pension/pensionMain";
	}
	
}
