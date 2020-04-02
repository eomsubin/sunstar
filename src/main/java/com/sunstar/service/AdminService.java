package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

public interface AdminService {

	List<HashMap<String, String>> getSellerApply(HashMap<String, String> map);
	List<HashMap<String, String>> getSellerList(HashMap<String, String> map);


}
