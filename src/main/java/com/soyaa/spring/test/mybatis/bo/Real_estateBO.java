package com.soyaa.spring.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.mybatis.dao.Real_estateDAO;
import com.soyaa.spring.test.mybatis.model.Real_estate;

@Service
public class Real_estateBO {

	@Autowired
	private Real_estateDAO real_estateDAO;
	
	// 1번
	public Real_estate getReal_estate(int id) {
		Real_estate real_estate = real_estateDAO.selectReal_estate(id);
		return real_estate;
	}
	
	// 2번
	public List<Real_estate> getRentPrice(Integer rentPrice) {
		List<Real_estate> real_estate = real_estateDAO.selectReal_estateRentPrice(rentPrice);
		return real_estate;
	}
	
	// 3번
	public List<Real_estate> getAreaPrice(int area, int price) {
//		List<Real_estate> real_estate = real_estateDAO.selectReal_estateAreaPrice(area, price);
//		return real_estate;
		
		// DAO 가 return 하는 게 List<Real_estate> 니까
		return real_estateDAO.selectReal_estateAreaPrice(area, price);
	}
	
	
	// test02
	
	// 1번
	public int addReal_estateByObject() {
		
	}
	
}
