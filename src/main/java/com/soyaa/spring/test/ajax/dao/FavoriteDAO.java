package com.soyaa.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soyaa.spring.test.ajax.model.Favorite;

@Repository
public interface FavoriteDAO {

	public int insertFavorite(
			@Param("name") String name
			, @Param("url") String url);
	
	public List<Favorite> selectFavorite();
	
	// url 중복여부
	public int selectCountDuplicateUrl(@Param("url") String url);
	
	public int deleteFavorite(@Param("id") int id);
}
