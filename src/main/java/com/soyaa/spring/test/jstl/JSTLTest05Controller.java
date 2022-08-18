package com.soyaa.spring.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soyaa.spring.test.jstl.bo.WeatherHistoryBO;
import com.soyaa.spring.test.jstl.model.Weathers;

@Controller
public class JSTLTest05Controller {

	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/jstl/test05")
	public String getWeatherHistory(Model model) {
		
		List<Weathers> weathers = weatherHistoryBO.getWeatherHistory();
		
		model.addAttribute("weathers", weathers);
		
		return "jstl/test05";
	}
	
//	@GetMapping("/jstl/weatherInput")
//	public String weatherInput() {
//		
//		return "jstl/weatherInput";
//	}
	
	
	
	// 선생님 풀이
	@GetMapping("/jstl/weather/list")
	public String weatherList(Model model) {
	
		List<Weathers> weathers = weatherHistoryBO.getWeatherHistory();
		
		model.addAttribute("weathers", weathers);
		
		return "jstl/weather/list";
	}
	
	@GetMapping("/jstl/weather/input") 
	public String weatherInput() {		
		return "jstl/weather/input";
	}
	
	
	@GetMapping("/jstl/weather/add")
	// @ResponseBody
	public String addWeather(
//			@RequestParam("date") String stringDate  // 2022-08-18 -> BO -> DAO -> xml에서 매칭된 #{date} : query 형태를 맞추면 자연스레 입력이 되는 것 : query 형태 '2022-08-20 00:00:00'
			                                         // 즉, 2022년 08월 20일을 query 형식으로 바꿔주어야함
													 // Spring 안에 간단하게 바꾸어주는 기능이 있음!! 문자열로 저장되는 걸 Date객체로 저장하기 
													 // Date 객체로 전달해줄 건데 Date 객체로 바꾸어주는 기능 @DateTimeFormat(pattern="yyyy년 MM월 dd일") -> 전달할 객체 바로 위에 이 언어테이션을 붙여서 전달된 데이터의 형태를 잡아주면 됨
			@DateTimeFormat(pattern="yyyy년 MM월 dd일")
			@RequestParam("date") Date date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed 
			, Model model
			) {
		
//		String yyyy = stringDate.substring(0, 4);
//		String MM = stringDate.substring(6, 8);
//		String dd = stringDate.substring(10, 12);
//		
//		String date = yyyy + "-" + MM + "-" + dd;
		
		int count = weatherHistoryBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		
//	
//		List<Weathers> weathers = weatherHistoryBO.getWeatherHistory();
//		model.addAttribute("weathers", weathers);
//		return "/jstl/weather/list";

		// redirect 하는 법 
		// redirect 는 jsp 를 return 하는 것이 아니라 실제 이동할 주소를 입력해야함 (절대경로)
		// (절대경로: host뒤에 붙는 모든 경로를 다 작성하는 것)
		return "redirect:/jstl/weather/list";
		
	}
	
	
	
	
}
