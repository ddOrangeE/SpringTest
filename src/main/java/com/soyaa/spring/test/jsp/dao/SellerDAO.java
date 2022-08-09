package com.soyaa.spring.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.jsp.model.Seller;

@Repository
public interface SellerDAO {

	// test01
	
	// 1번
	public int insertSeller(
			@Param("nickname") String nickname
			, @Param("url") String url
			, @Param("temperature") double temperature
			);
	
	
	// 2번
	public Seller sellectSeller();
	
	// 3번
	public Seller sellectSellerbyId(@Param("id") Integer id);
}
