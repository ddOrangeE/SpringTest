package com.soyaa.spring.test.ajax.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.ajax.dao.PensionDAO;
import com.soyaa.spring.test.ajax.model.Pension;

@Service
public class PensionBO {

	@Autowired
	private PensionDAO pensionDAO;
	
	public List<Pension> getPensionList() {
		return pensionDAO.selectPension();
	}
	
	public int deletePension(int id) {
		return pensionDAO.deletePension(id);
	}
	
	public int resuervationPension(
			String name
			, String date
			, int day
			, int headcount
			, String phoneNumber) {
		
		return pensionDAO.insertPension(name, date, day, headcount, phoneNumber, "대기중");
		
		// 정책적인 문제는 BO에서 해주는 것이 좋다
		// 대기중, 확정을 컨트롤러 에서 받는 건 아닌 것 같고, 최대한 DAO 를 바보로 만드는 것이 좋기 때문에 BO가 최적!
	}
	
	public List<Pension> checkReservation(String name, String phoneNumber) {
		return pensionDAO.selectPension();
	}
}
