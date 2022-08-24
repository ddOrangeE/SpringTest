package com.soyaa.spring.test.ajax.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.ajax.model.Pension;

@Repository
public interface PensionDAO {

	public List<Pension> selectPension();
	
	public int deletePension(@Param("id") int id);
	
	public int insertPension(
			@Param("name") String name
			, @Param("date") String date
			, @Param("day") int day
			, @Param("headcount") int headcount
			, @Param("phoneNumber") String phoneNumber
			, @Param("state") String state);
	
	public List<Pension> selectPensionByParameter(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
}
