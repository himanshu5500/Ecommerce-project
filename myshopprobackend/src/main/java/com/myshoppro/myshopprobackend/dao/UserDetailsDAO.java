package com.myshoppro.myshopprobackend.dao;

import com.myshoppro.myshopprobackend.model.UserDetails;

public interface UserDetailsDAO {
	public void insertOrUpdateUserDetails(UserDetails userDetails);
	public UserDetails getUserDetails(String username);
	
}
