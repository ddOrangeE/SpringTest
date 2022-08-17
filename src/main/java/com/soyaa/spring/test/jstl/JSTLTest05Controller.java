package com.soyaa.spring.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			@RequestParam("date") String stringDate
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed 
			, Model model
			) {
		
		String yyyy = stringDate.substring(0, 4);
		String MM = stringDate.substring(6, 8);
		String dd = stringDate.substring(10, 12);
		
		String date = yyyy + "-" + MM + "-" + dd;
		
		int count = weatherHistoryBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		
	
		List<Weathers> weathers = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weathers", weathers);
		return "/jstl/weather/list";
		
	}
	
	
	
	
}
