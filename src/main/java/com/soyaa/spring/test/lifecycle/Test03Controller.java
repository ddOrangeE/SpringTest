package com.soyaa.spring.test.lifecycle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test03Controller {
	
	// 어느 위치의 파일로 갈 건지 리턴하는 거니까 ResponseBody 는 붙이면 안됨
	@RequestMapping("/lifecycle/test03/1")
	public String test03View() {
		return "lifecycle/test03";
	}
}
