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
	public List<CategoryDTO> getLv2(String lv1select) {
		// TODO Auto-generated method stub
		
	
		
		
		return adminmapper.getLv2(lv1select);
	}

	@Override
	public List<CategoryDTO> getLv3(String lv2select) {
		// TODO Auto-generated method stub
		return adminmapper.getLv3(lv2select);
	}

	@Override
	public List<CategoryDTO> getLv2() {
		// TODO Auto-generated method stub
		return adminmapper.getLv2();
	}

	@Override
	public List<CategoryDTO> getLv3() {
		// TODO Auto-generated method stub
		return adminmapper.getLv3();
	}

	@Override
	public void add_lv2(CategoryDTO cdto) {
		
		if(cdto.getLv1().equals("패션")) {
			cdto.setLv2con("A");
		}else if(cdto.getLv1().equals("디지털-가전")) {
			cdto.setLv2con("B");
		}else if(cdto.getLv1().equals("가구-인테리어")) {
			cdto.setLv2con("C");
		}else if(cdto.getLv1().equals("식품")) {
			cdto.setLv2con("D");
		}else {
			cdto.setLv2con("E");
		}
		
		adminmapper.add_lv2(cdto);
		
	}
	
	

}
