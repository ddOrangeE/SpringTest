package com.soyaa.spring.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSTLTest05Controller {

	@GetMapping("/jstl/test05")
	public String jstlTest05() {
		return "jstl/test05";
	}
}
