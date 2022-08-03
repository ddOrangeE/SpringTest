package com.soyaa.spring.test.lifecycle.model;

public class Post {

	// Controller 가 아님!! 그냥 정보를 저장하는 것이기 때문에 그대로 가져가면 됨
	
	private String title;
	private String user;
	private String content;
	
	// ResponseBody 가 가져다 쓸 수 있도록 만들어줘야함
	// 멤버변수로 저장되었기 때문에 가져다 쓸 수 없음
	// getter, setter 필요!!
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
