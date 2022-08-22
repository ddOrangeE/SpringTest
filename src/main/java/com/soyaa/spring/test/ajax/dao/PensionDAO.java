package com.soyaa.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.ajax.model.Pension;

@Repository
public interface PensionDAO {

	public List<Pension> selectPension();
	
	public int deletePension(@Param("id") int id);
}
