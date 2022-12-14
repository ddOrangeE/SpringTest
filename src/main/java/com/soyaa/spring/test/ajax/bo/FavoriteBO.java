package com.soyaa.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soyaa.spring.test.ajax.dao.FavoriteDAO;
import com.soyaa.spring.test.ajax.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int addFavorite(String name, String url) {
		return favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavorite();
	}
	
	// url 중복여부
	public boolean isDuplicateUrl(String url) {
		
		int count = favoriteDAO.selectCountDuplicateUrl(url);
		
//		if(count == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
//		count != 0; 일 때 true 가 return
		
		// 즉 이렇게 까지 줄일 수 있다
//		return count != 0;
		
		return favoriteDAO.selectCountDuplicateUrl(url) != 0;
	}
	
	public int deleteFavorite(int id) {
		return favoriteDAO.deleteFavorite(id);
	}
}
