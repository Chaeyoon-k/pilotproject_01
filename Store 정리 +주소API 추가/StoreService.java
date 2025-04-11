package com.lgy.ShoFriend.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.ShoFriend.dto.StoreDTO;

public interface StoreService {
	
	public ArrayList<StoreDTO> store_list();
	public void store_write(HashMap<String, String> param);
	public StoreDTO store_view(HashMap<String, String> param);
	public void store_modify(HashMap<String, String> param);
	public void store_delete(HashMap<String, String> param);
	
}
