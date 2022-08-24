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

	@PostMapping("/check")
	public String checkReservation(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, Model model) {
		
		List<Pension> reservation = pensionBO.checkReservation(name, phoneNumber);
		
		model.addAttribute("reservation", reservation);
		
		
	}


}
