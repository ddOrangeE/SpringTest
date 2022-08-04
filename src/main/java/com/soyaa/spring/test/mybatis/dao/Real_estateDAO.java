package com.soyaa.spring.test.mybatis.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.mybatis.model.Real_estate;

@Repository
public interface Real_estateDAO {

	public Real_estate selectReal_estate(@Param("id") int id);
}
