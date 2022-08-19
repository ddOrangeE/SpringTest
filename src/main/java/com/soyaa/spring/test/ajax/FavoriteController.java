package com.soyaa.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.ajax.bo.FavoriteBO;
import com.soyaa.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {

	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// View 형식
	@GetMapping("/input")
	public String favoriteInput() {
		
		return "ajax/favoriteInput";
	}

	@GetMapping("/list")
	public String getFavorite(Model model) {
		
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		// value 만 넣었는데 왜 되징..? model.addAttribute(favoriteList); 이것도 됐음
		// spring framework 가 알아서 해주는 것들이 되게 많음, requestParam 같은 거나, Param 같은 것도 안붙여도 알아서 해줄 수 있는데 내가 붙여주는 게 에러찾기 쉬움
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "ajax/favoriteList";
	}
	
	// redirect :입력과정이나, 입력한 내용에 문제가 있었을 때 무조건 페이지 이동이 되니까 문제발견 어려움, 사용자에게 이질감 줄 수 있음
	// ajax : 문제가 생겼을 땐 그 상태 그대로 문제를 알려줄 수 있기 때문에 Input 하는 것은 ajax 를 통해서 하는 게 더 좋다!!
	
	// API 형식
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addFavorite(
			@RequestParam("name") String name
			, @RequestParam("url") String url) {
		
		int count = favoriteBO.addFavorite(name, url);
		
		Map<String, String> map = new HashMap<>();
		
		// 직접 json 문자열로 만들어줄 수 있지만 어려우니까 "{\"result\": 이런식으로 해야됨,,
		// 이렇게 json 형태와 비슷한 map 으로 return 해주면 responseBody가 {"":""} 과 같은 형태로 만들어준다!!
		// {"result":"success"}
		if(count == 1) {
			map.put("result", "success");
		} else { // {"result":"fail"}
			map.put("result", "fail");
		}
		
		return map;
	}
	
	// 이렇게 API 만들면 ajax를 쓰는 건 다른 개발자
	
	// url 중복 여부 api
	@GetMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean> isDuplicate(@RequestParam("url") String url) {
		
		boolean isDuplicate = favoriteBO.isDuplicateUrl(url);
		
		Map<String, Boolean> map = new HashMap<>();
		
		// {"is_duplicate":ture} or {"is_duplicate":false}
		
		if(isDuplicate) {
			map.put("is_duplicate", true);
		} else {
			map.put("is_duplicate", false);
		}
		
		return map;
	}
	
	// 삭제
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteFavorite(@RequestParam("id") int id) {
		
		int count = favoriteBO.deleteFavorite(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
		
	}
}
