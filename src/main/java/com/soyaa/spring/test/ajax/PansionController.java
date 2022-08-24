package com.soyaa.spring.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.ajax.bo.PensionBO;
import com.soyaa.spring.test.ajax.model.Pension;

@Controller
@RequestMapping("/ajax/pension")
public class PansionController {

	@Autowired
	private PensionBO pensionBO;
	
	@GetMapping("/header")
	public String pension() {
		return "ajax/pension/header";
	}
	
	
	@GetMapping("/main")
	public String pensionMain() {
		return "ajax/pension/pensionMain";
	}
	

	@GetMapping("/list")
	public String getPensionList(Model model) {
		
		List<Pension> pensionList =  pensionBO.getPensionList();
		
		model.addAttribute("pensionList", pensionList);
		
		return "ajax/pension/pensionList";
	}

	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deletePension(@RequestParam("id") int id) {
		
		int count = pensionBO.deletePension(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@GetMapping("/reservation")
	public String reservationPension() {
		
		return "ajax/pension/pensionReservation";
	}

	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> reservationPension(
			@RequestParam("name") String name
			// , @DateTimeFormat(pattern="yyyy년MM월dd일") // 2022년 08월 23일  (얘 쓰려면 얘한테 쉼표 붙여주고 RequestParam에는 붙이지 말기)
			, @RequestParam("date") String date // 2022-08-23
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		int count = pensionBO.resuervationPension(name, date, day, headcount, phoneNumber);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}

	// 이름과 전화번호가 일치하는 정보는 딱하나만 있다고 가정하에 간다!! (여러개면 처리하기 힘듦)
	
	// 이걸 어떻게 전달할까
	// [] {} json 형태로 한 번 표현 해보자
	// {
	//		"name":"김인규"
	//		"phoneNumber":"010-1234-5678"
	//		"date":"2022-08-12"  
	// }
	// 이런 형태로 데이터를 만들어내면 가장 이상적인 json 형태이 듯 -> 이렇게 하면 별로 규격화되어 보이지 않아
	// 규격화 한 json 
	// {
	// "result" : "success",
	// "data":{
		//		"name":"김인규"
		//		"phoneNumber":"010-1234-5678"
		//		"date":"2022-08-12"  
		// 		}
	// }
	@PostMapping("/find")
	@ResponseBody
	public Map<String, Object> findReservation(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Pension reservation = pensionBO.checkReservation(name, phoneNumber);
//		return reservation;   // responseBody 를 붙이고 클래스를 그대로 return 해주면 멤버변수 이름을 key 로, 값을 value 로 해서 json형태로 만들어준다
//		// http 컴버셔(?) 가 어? 클래스네? 그래서 jackson 라이브러리가 바꿔주고 다시 전달해주고 요런식으로

		// 규격화된 json : 명확하게 구조화할 수 있음
		
		Map<String, Object> result = new HashMap<>();
		
		if(reservation != null) {
			result.put("result", "success");
			result.put("data", reservation);
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

	// PostMapping일 때 확인하려면 ajax를 짜거나 form으로 묶어줘서 확인해야하는데 간단하게 확인할 수 있게 해주는 프로그램들이 있다. 
	// PostMan 다운로드!!
	
	// json 으로 만드는 이유 : 규격화하기 위해서 
	
}
