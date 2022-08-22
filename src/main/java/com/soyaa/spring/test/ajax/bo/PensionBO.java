package com.soyaa.spring.test.ajax.bo;

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
}
