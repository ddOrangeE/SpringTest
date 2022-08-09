package com.soyaa.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.jsp.dao.SellerDAO;
import com.soyaa.spring.test.jsp.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;

	// test01
	
	// 1번
	public int addSeller(String nickname, String url, double temperature) {
		return sellerDAO.insertSeller(nickname, url, temperature);
	}

	// 2번
	public Seller getSeller() {
		return sellerDAO.sellectSeller();
	}
	
	// 3번
	public Seller getSellerbyId(Integer id) {
		return sellerDAO.sellectSellerbyId(id);
	}

}
