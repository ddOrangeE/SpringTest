package com.soyaa.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String pensionList() {
		return "ajax/pension/pensionList";
	}

	@GetMapping("/select")
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




}
