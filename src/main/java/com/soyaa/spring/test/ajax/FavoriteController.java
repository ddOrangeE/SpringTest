package com.soyaa.spring.test.ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {

	@GetMapping("/input")
	public String favoriteInput() {
		
		return "ajax/favoriteInput";
	}
	
	@GetMapping("/add")
	public addFavorite(
			@RequestParam("")
			) {
		
		
		
	}
	
}
