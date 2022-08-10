package com.soyaa.spring.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {

	public int insertRealtorByObject(Realtor realtor);
}
