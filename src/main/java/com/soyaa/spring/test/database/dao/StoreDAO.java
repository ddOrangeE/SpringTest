package com.soyaa.spring.test.database.dao;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.database.model.Store;

@Repository
public interface StoreDAO {

	// store 테이블의 모든 데이터 조회 결과 리턴
	
	// store 의 모든 행을 리턴해야함 - 여러개니까 List
	// Map 을 통해서도 가능하지만 key 를 매번 잡아주는 것도 번거롭고 그렇다 -> class 로 만들자
	public List<Store> selectStoreList();
	
	// 메소드 이름도 쿼리이름으로 만들어주는 게 좋다
	// import 할 떄 내가 만든 클래스로 추가 해줘야 한다!!
	
}
