package com.soyaa.spring.test.jstl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.jstl.model.Weathers;

@Repository
public interface WeatherHistoryDAO {

	public List<Weathers> selectWeatherHistory();

	public int insertWeather(
			@Param("date") String date
			, @Param("weather") String weather
			, @Param("temperatures") double temperatures
			, @Param("precipitation") double precipitation
			, @Param("microDust") String microDust
			, @Param("windSpeed") double windSpeed);
}
