package com.sunstar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.AccountsDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MailDTO;
import com.sunstar.mapper.AdminMapper;
import com.sunstar.mapper.MyPageMapper;

@Service("adminservice")
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper adminmapper;
	
	@Override // jinwoo
	public List<HashMap<String, String>> getSellerApply(HashMap<String, String> map) {
		return adminmapper.getSellerApply(map);
	}

	@Override // jinwoo
	public List<HashMap<String, String>> getSellerList(HashMap<String, String> map) {
		return adminmapper.getSellerList(map);
	}

	@Override // jinwoo
	public List<HashMap<String, Object>> getCSellerList(String id) {
		StringTokenizer str = new StringTokenizer(id,",");
		List<String> idl = new ArrayList<String>();
		while(str.hasMoreTokens())
		{
			idl.add(str.nextToken());
		}
		return adminmapper.getCSellerList(idl);
	}

	@Override // jinwoo
	public List<HashMap<String, Object>> getCSellerprduct(String id) {
		StringTokenizer str = new StringTokenizer(id,",");
		List<String> idl = new ArrayList<String>();
		while(str.hasMoreTokens())
		{
			idl.add(str.nextToken());
		}
		return adminmapper.getCSellerprduct(idl);
	}

	@Override // jinwoo
	public List<HashMap<String, Object>> getCSellerordered(String id) {
		StringTokenizer str = new StringTokenizer(id,",");
		List<String> idl = new ArrayList<String>();
		while(str.hasMoreTokens())
		{
			idl.add(str.nextToken());
		}
		return adminmapper.getCSellerordered(idl);
	}
	
	@Override // jinwoo
	public List<HashMap<String, Object>> getCustomerList(HashMap<String, String> map) {
		return adminmapper.getCustomerList(map);
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

	@Override
	public void add_lv3(CategoryDTO cdto) {
		
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
			
		adminmapper.add_lv3(cdto);
		
	}
	
	@Override
	public void droplv2(CategoryDTO cdto) {
		adminmapper.droplv2(cdto);
		
	}

	@Override
	public void droplv3(CategoryDTO cdto) {
		adminmapper.droplv3(cdto);
		
	}
	//메일
	@Override
	public List<MailDTO> getMails() {
		return adminmapper.getMails();
	}

	@Override
	public void updateReply(MailDTO dto) {
		adminmapper.updateReply(dto);
	}

	@Override
	public List<AccountsDTO> getAccList() {
		// TODO Auto-generated method stub
		return adminmapper.getAccList();
	}

	@Override
	public void updateAccList(AccountsDTO dto) {
		adminmapper.updateAccList(dto);
	}
}
