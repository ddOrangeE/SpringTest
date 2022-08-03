package com.soyaa.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soyaa.spring.test.lifecycle.model.Post;

@RestController // @Controller + @RespeonseBody (모든 메소드들은 ResponseBody 기반으로 만들거다! 하면 RestController 사용하면 됨
@RequestMapping("/lifecycle/test02")
public class Test02Controller {

	// 선생님 풀이
	// 1번
	@RequestMapping("/1")
	public List<Map<String, Object>> listMapResponse() {
		
		// 객체의 실체는 딱 하나일 뿐이다.
		// new 하는 순간 만들어진다.
		// movie 를 만들면 heap 메모리 영역에 만들어지고, movie 는 heap 메모리 영역에 저장된 걸 가리킨다 (즉 주소를 저장)
		// 그걸 List 에 저장하면 list 는 heap 메모리영역에 만들어진 맵을 가리킨다.
		// movie 를 새롭게 만들면 movie가 가리키던 주소가 사라지고, heap 에 새로운 맵이 저장, 그 주소를 movie가 가리키고, 그걸 list에 저장하면 list는 그 주소를 저장!!
		// 이렇게 반복!!
		
		List <Map<String, Object>> movieList = new ArrayList<>(); 
		
		Map<String, Object> movie = new HashMap<>();
		movie.put("title", "기생충");
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("rate", 15);
		
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "인생은 아름다워");
		movie.put("director", "로베르토 베니니");
		movie.put("time", 166);
		movie.put("rate", 0);
		
		movieList.add(movie);
		
		movie = new HashMap<>();
		movie.put("title", "인셉션");
		movie.put("director", "크리스토퍼 놀란");
		movie.put("time", 147);
		movie.put("rate", 12);
		
		movieList.add(movie);
		
		return movieList;
	}
		
	
//	// 1번
//	@RequestMapping("/1")
//	public List<Map<String, Object>> listResponse() {
//		
//		List<Map<String, Object>> list = new ArrayList<>();
//		
//		// Object : 여러 형태 모두 저장할 수 있다.
//		Map<String, Object> map1 = new HashMap<>();
//		map1.put("rate", 15);
//		map1.put("director", "봉준호");
//		map1.put("time", 131);
//		map1.put("title", "기생충");
//		
//		list.add(map1);
//		
//		Map<String, Object> map2 = new HashMap<>();
//		map2.put("rate", 0);
//		map2.put("director", "로베르토 베니니");
//		map2.put("time", 166);
//		map2.put("title", "인생은 아름다워");
//		
//		list.add(map2);
//		
//		Map<String, Object> map3 = new HashMap<>();
//		map3.put("rate", 12);
//		map3.put("director", "크리스토퍼 놀란");
//		map3.put("time", 147);
//		map3.put("title", "인셉션");
//		
//		list.add(map3);
//		
//		Map<String, Object> map4 = new HashMap<>();
//		map4.put("rate", 19);
//		map4.put("director", "윤종빈");
//		map4.put("time", 133);
//		map4.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
//		
//		list.add(map4);
//		
//		Map<String, Object> map5 = new HashMap<>();
//		map5.put("rate", 15);
//		map5.put("director", "프란시스 로렌스");
//		map5.put("time", 137);
//		map5.put("title", "헝거게임");
//		
//		list.add(map5);
//		
//		return list;
//	}
//	
//	
	
	// 선생님 풀이
	// 2번 (model 폴더의 post 사용)
	@RequestMapping("/2")
	public List<Post> listObjectResponse() {
		
		List<Post> postList = new ArrayList<>();
		
		Post post = new Post();
		post.setTitle("안녕하세요 가입인사 드립니다.");
		post.setUser("hagulu");
		post.setContent("안녕하세요 가입했어요. 앞으로 잘 부탁 드립니다.");
		
		postList.add(post);
		
		post = new Post();
		post.setTitle("헐 대박");
		post.setUser("bada");
		post.setContent("오늘 수요일이었어, 금요일인줄");
		
		postList.add(post);
		
		// heap 메모리 영역을 가리키는 것이기 때문에 post 변수에 new 얼마든지 저장 가능!!
		post = new Post();
		post.setTitle("오늘 데이트 한 이야기 해드릴게요");
		post.setUser("dulumary");
		post.setContent("....");
		
		postList.add(post);
	
		return postList;
	}

	
//	// 2번
//	@RequestMapping("/2")
//	public List<Map<String, String>> listResponse2() {
//		List<Map<String, String>> list = new ArrayList<>();
//		
//		Map<String, String> map1 = new HashMap<>();
//		map1.put("title", "안녕하세요 가입인사 드립니다.");
//		map1.put("user", "hagulu");
//		map1.put("content", "안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
//		
//		list.add(map1);
//
//		Map<String, String> map2 = new HashMap<>();
//		map2.put("title", "헐 대박");
//		map2.put("user", "bada");
//		map2.put("content", "오늘 목요일이 었어.... 금요일인줄");
//		
//		list.add(map2);
//
//		Map<String, String> map3 = new HashMap<>();
//		map3.put("title", "오늘 데이트 한 이야기 해드릴게요.");
//		map3.put("user", "dulumary");
//		map3.put("content", ".......ㅋ");
//		
//		list.add(map3);
//		
//		return list;
//
//	}
//	
	
	// 선생님 풀이
	// 3번
	// 게시글 한 개니까 그냥 <Post>로 잡아주기
	
	// 500 에러
	@RequestMapping("/3")
	public ResponseEntity<Post> entity() {
		Post post = new Post();
		post.setTitle("안녕하세요 가입인사 드립니다.");
		post.setUser("hagulu");
		post.setContent("안녕하세요 가입했어요. 앞으로 잘 부탁 드립니다.");
		
		ResponseEntity<Post> entity = new ResponseEntity(post, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
		
	}
	
	
//	// 3번
//	@RequestMapping("/3")
//	public ResponseEntity<Content> entityResponse() {
//		
//		Content content = new Content();
//		content.setTitle("안녕하세요 가입인사 드립니다.");
//		content.setUser("hagulu");
//		content.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
//		
//		ResponseEntity<Content> entity = new ResponseEntity(content, HttpStatus.INTERNAL_SERVER_ERROR);
//		
//		return entity;
//	}
//	
	
	
}
