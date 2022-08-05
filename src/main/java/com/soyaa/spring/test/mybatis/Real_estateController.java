package com.soyaa.spring.test.mybatis;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.mybatis.bo.Real_estateBO;
import com.soyaa.spring.test.mybatis.model.Real_estate;

@Controller
@RequestMapping("/mybatis")
public class Real_estateController {

	@Autowired
	private Real_estateBO real_estateBO;

	// 1번
	// 사용자에게 받을 땐 그냥 Param 이 아니라 RequestParam
	@RequestMapping("/test01/1")
	@ResponseBody
	public Real_estate real_estate(@RequestParam("id") int id) {
		Real_estate real_estate = real_estateBO.getReal_estate(id);
		return real_estate;
	}
	
	// 2번
	@RequestMapping("/test01/2")
	@ResponseBody
	// 선생님은 getRealEstateAsRent 로 함
	public List<Real_estate> checkRentPrice(@RequestParam("rentPrice") Integer rentPrice) {
		List<Real_estate> real_estate = real_estateBO.getRentPrice(rentPrice);
		return real_estate;
	}
	
	// 3번
	@RequestMapping("/test01/3")
	@ResponseBody
	public List<Real_estate> real_estateAreaPrice(@RequestParam("area") int area
			, @RequestParam("price") int price
			){
		
		List<Real_estate> real_estate = real_estateBO.getAreaPrice(area, price);
		return real_estate;
	}
// List 안에는 Map 또는 객체 형태구나..!

	// test02
	
	// 1번
	@RequestMapping("/test02/1")
	public String addReal_estateByObject() {
		
		return "입력 성공 : " ;
	}




}



