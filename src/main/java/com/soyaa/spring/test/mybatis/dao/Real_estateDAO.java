package com.soyaa.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.mybatis.model.Real_estate;

@Repository
public interface Real_estateDAO {
	
	// 1번
	public Real_estate selectReal_estate(@Param("id") int id);

	// 2번
	public List<Real_estate> selectReal_estateRentPrice(@Param("rentPrice") Integer rentPrice);

	// 3번
	public List<Real_estate> selectReal_estateAreaPrice(@Param("area") int area
			, @Param("price") int price
			);
	
	
	// test02
	
	// 1번
	public int insertReal_estateByObject(Real_estate real_estate);
	
}