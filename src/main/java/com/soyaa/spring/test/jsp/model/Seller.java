package com.soyaa.spring.test.jsp.model;

import java.util.Date;

public class Seller {

	private int id;
	private String nickname;
	
	// mybatis 가 조회한 결과를 멤버변수에 찰떡같이 넣어주는 이유는 칼럼이름과 멤버변수 이름이 일치하는 곳에다가 저장해주기 때문!!
	// 즉 멤버변수는 칼럼이름과 같아야 한다!!!ㅜㅜㅜㅜㅜㅜ
	
	// 컬럼 타입도 맞추는 게 좋다!! 안맞추더라도 에러는 안남! 
	// 그런데 너무 쌩뚱 맞은 걸로 하면 당연히 에러남 이름 타입을 Date 로 잡는다거나,,
	private String profileImageUrl;
	private String temperature;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileImageUrl() {
		return profileImageUrl;
	}
	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
