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
	public int addReal_estateByObject(Real_estate real_estate) {
		return real_estateDAO.insertReal_estateByObject(real_estate);
	}
	
	// 2번
	// java 문법 그대로 사용
	public int addReal_estate(int realtorId
			, String address
			, int area
			, String type
			, int price
			, Integer rentPrice) {
		return real_estateDAO.insertReal_estate(realtorId, address, area, type, rentPrice, price);
	}
	
	// test03
	
	public int updateReal_estate(int id, String type, int price) {
		return real_estateDAO.updateReal_estate(id, type, price);
	}
	
	// test04
	public int deleteReal_estate(int id) {
		return real_estateDAO.deleteReal_estate(id);
	}
	
}
