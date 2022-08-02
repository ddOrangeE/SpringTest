package com.soyaa.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soyaa.spring.test.lifecycle.model.Content;

@Controller
@RequestMapping("/lifecycle/test02")
public class Test02Controller {

	// 1번
	@RequestMapping("/1")
	@ResponseBody
	public List<Map<String, Object>> listResponse() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map1 = new HashMap<>();
		map1.put("rate", 15);
		map1.put("director", "봉준호");
		map1.put("time", 131);
		map1.put("title", "기생충");
		
		list.add(map1);
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("rate", 0);
		map2.put("director", "로베르토 베니니");
		map2.put("time", 166);
		map2.put("title", "인생은 아름다워");
		
		list.add(map2);
		
		Map<String, Object> map3 = new HashMap<>();
		map3.put("rate", 12);
		map3.put("director", "크리스토퍼 놀란");
		map3.put("time", 147);
		map3.put("title", "인셉션");
		
		list.add(map3);
		
		Map<String, Object> map4 = new HashMap<>();
		map4.put("rate", 19);
		map4.put("director", "윤종빈");
		map4.put("time", 133);
		map4.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		
		list.add(map4);
		
		Map<String, Object> map5 = new HashMap<>();
		map5.put("rate", 15);
		map5.put("director", "프란시스 로렌스");
		map5.put("time", 137);
		map5.put("title", "헝거게임");
		
		list.add(map5);
		
		return list;
	}
	
	
	// 2번
	@RequestMapping("/2")
	@ResponseBody
	public List<Map<String, String>> listResponse2() {
		List<Map<String, String>> list = new ArrayList<>();
		
		Map<String, String> map1 = new HashMap<>();
		map1.put("title", "안녕하세요 가입인사 드립니다.");
		map1.put("user", "hagulu");
		map1.put("content", "안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		list.add(map1);

		Map<String, String> map2 = new HashMap<>();
		map2.put("title", "헐 대박");
		map2.put("user", "bada");
		map2.put("content", "오늘 목요일이 었어.... 금요일인줄");
		
		list.add(map2);

		Map<String, String> map3 = new HashMap<>();
		map3.put("title", "오늘 데이트 한 이야기 해드릴게요.");
		map3.put("user", "dulumary");
		map3.put("content", ".......ㅋ");
		
		list.add(map3);
		
		return list;

	}
	
	// 3번
	@RequestMapping("/3")
	@ResponseBody
	public ResponseEntity<Content> entityResponse() {
		
		Content content = new Content();
		content.setTitle("안녕하세요 가입인사 드립니다.");
		content.setUser("hagulu");
		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		ResponseEntity<Content> entity = new ResponseEntity(content, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}
	
	
	
}
