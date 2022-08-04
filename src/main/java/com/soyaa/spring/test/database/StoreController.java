package com.soyaa.spring.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.database.bo.StoreBO;
import com.soyaa.spring.test.database.model.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	
	
	// Store의 모든 데이터를 json 형태로 response 에 담는다. (데이터베이스의 store 자체를 모르기 때문에 table인지 뭔지 모름)
	
	@ResponseBody
	@RequestMapping("database/test01")
	public List<Store> test01() {
		List<Store> storeList = storeBO.getStoreList();
		
		return storeList;
	}
}
