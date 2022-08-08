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

	private static final Integer NULL = null;
	@Autowired
	private Real_estateBO real_estateBO;

	// test 01
	
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
	@ResponseBody
	@RequestMapping("/test02/1")
	public String addReal_estateByObject() {
		
		Real_estate real_estate = new Real_estate();
		
		real_estate.setRealtorId(3);
		real_estate.setAddress("푸르지용 리버 303동 1104호");
		real_estate.setArea(89);
		real_estate.setType("매매");
		real_estate.setPrice(100000);
		
		return "입력 성공 : " + real_estateBO.addReal_estateByObject(real_estate);
	}

	// 2번
	// parameter 을 전달받기 위한 거니까 여기는 @RequestParam 써야됨
	@RequestMapping("/test02/2")
	@ResponseBody	
	public String addReal_estate(@RequestParam("realtorId") int realtorId) {
		int count = real_estateBO.addReal_estate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + count;
	}
	
	// 자기가 자기일 한다!! - 모듈화 한다
	
	@RequestMapping("/test02/3")
	@ResponseBody	
	public String addReal_estate2(@RequestParam("realtorId") int realtorId) {
		int count = real_estateBO.addReal_estate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, NULL);
		return "입력 성공 : " + count;
	}


	// test03
	
	@RequestMapping("/test03/1")
	@ResponseBody
	public String updateReal_estate() {
		
		// BO에서 값을 전달받을 수 있도록 BO에 값을 전달 받을 수 있는 메소드 만들기
		// BO가 DAO 한테 전달
		int count = real_estateBO.updateReal_estate(25, "전세", 70000);
		
		return "수정 성공 : " + count;
	}

	// test04
	
	@RequestMapping("/test04/1")
	@ResponseBody
	public String deleteReal_estate(@RequestParam("id") int id) {
		
		int count = real_estateBO.deleteReal_estate(id);
		
		return "삭제 성공 : " + count;
		
	}
	
}

// 에러가 떴을 땐 sts에서 보는 것이 가장 중요하다 웹에서 보여주는 건 간결하게 보여줌


