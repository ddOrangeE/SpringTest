package com.soyaa.spring.test.mybatis;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.mybatis.bo.Real_estateBO;
import com.soyaa.spring.test.mybatis.model.Real_estate;

@Controller
public class Real_estateController {

	@Autowired
	private Real_estateBO real_estateBO;
	
	@RequestMapping("/real_estate")
	@ResponseBody
	public Real_estate real_estate(@Param("id") int id) {
		Real_estate real_estate = real_estateBO.getReal_estate(id);
		return real_estate;
	}
}
