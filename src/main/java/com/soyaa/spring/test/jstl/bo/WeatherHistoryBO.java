package com.soyaa.spring.test.jstl.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.jstl.dao.WeatherHistoryDAO;
import com.soyaa.spring.test.jstl.model.Weathers;

@Service
public class WeatherHistoryBO {

	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;

	public List<Weathers> getWeatherHistory() {
		
		return weatherHistoryDAO.selectWeatherHistory();
		
	}
	
	public int addWeather(
//			String date
			Date date // Controller 에서 이렇게 잡아줬으니까 바꾸어주어야 함
			, String weather
			, double temperatures
			, double precipitation
			, String microDust
			, double windSpeed) {
		
		return weatherHistoryDAO.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
	}
}
