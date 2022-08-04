package com.soyaa.spring.test.mybatis.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.mybatis.dao.Real_estateDAO;
import com.soyaa.spring.test.mybatis.model.Real_estate;

@Service
public class Real_estateBO {

	@Autowired
	private Real_estateDAO real_estateDAO;
	
	public Real_estate getReal_estate(int id) {
		Real_estate real_estate = real_estateDAO.selectReal_estate(id);
		return real_estate;
	}
}
