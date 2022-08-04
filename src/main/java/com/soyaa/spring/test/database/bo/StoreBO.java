package com.soyaa.spring.test.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.database.dao.StoreDAO;
import com.soyaa.spring.test.database.model.Store;

@Service
public class StoreBO {

	// DAO 라는 객체가 있어야 메소드가 호출이 되니까 객체 생성
	// 자바프레임워크한테 맡기자 : Bean 으로 등록할 수 있어야 이게 가능한데 DAO 가 Repository 어노테이션을 해줬으니까 가능!!
	@Autowired
	private StoreDAO storeDAO;
	
	// store의 모든 데이터 조회 리턴 (데이터베이스의 store 자체를 모르기 때문에 table인지 뭔지 모름)
	
	public List<Store> getStoreList() {
		
		List<Store> storeList = storeDAO.selectStoreList();
		
		return storeList;
	}
}
