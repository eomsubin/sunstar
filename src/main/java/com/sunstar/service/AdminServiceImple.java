package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.mapper.AdminMapper;
import com.sunstar.mapper.MyPageMapper;

@Service("adminservice")
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper adminmapper;
	
	@Override
	public List<HashMap<String, String>> getSellerApply(HashMap<String, String> map) {
		return adminmapper.getSellerApply(map);
	}

	@Override
	public List<HashMap<String, String>> getSellerList(HashMap<String, String> map) {
		return adminmapper.getSellerList(map);
	}

	@Override
	public List<CategoryDTO> getLv1() {
		
		return adminmapper.getLv1();
	}

	@Override
	public List<CategoryDTO> getLv2(CategoryDTO lv1data) {
		// TODO Auto-generated method stub
		return adminmapper.getLv2(lv1data);
	}
	
	

}
