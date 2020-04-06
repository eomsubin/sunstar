package com.sunstar.service;

import java.util.HashMap;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sunstar.dao.CustomerDAO;
import com.sunstar.dto.CustomerDTO;

@Service(value="userservice")
public class UserServiceimple implements UserService{

	@Resource(name="passwordEncoder")
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private CustomerDAO dao;
	
	@Transactional
	@Override //jinwoo
	public int join_Customer(CustomerDTO dto) {
		String newpwd = encoder.encode(dto.getPassword());
		dto.setPassword(newpwd);
		dao.join_Customer(dto);
		return dao.join_Customer_auth(dto);
	}

	@Override //jinwoo
	public int customeridcheck(String id) {
		return dao.customeridcheck(id);
	}

	@Override //jinwoo
	public int customeremailcheck(HashMap<String, String> map) {
		return dao.customeremailcheck(map);
	}

	@Override //jinwoo
	public CustomerDTO customerfindid(HashMap<String, String> map) {
		return dao.customerfindid(map);
	}

	@Override //jinwoo
	public int SetNewPassowrd(HashMap<String, String> map) {
		map.put("newpw", encoder.encode((map.get("newpw"))));
		return dao.SetNewPassowrd(map);
	}

	@Override //jinwoo
	public int join_Seller(HashMap<String, String> map) {
		return dao.join_Seller(map);
	}

	@Override //jinwoo
	public int selleridcheck(String id) {
		return dao.selleridcheck(id);
	}

	@Override //jinwoo
	public int join_Sellerauth(HashMap<String, String> map) {
		StringTokenizer st = new StringTokenizer(map.get("sid"),",");
		int result =0; 
		while(st.hasMoreTokens()) {
			result += dao.join_Sellerauth(st.nextToken());
		}
		return result;
	}

	@Override //jinwoo
	public int rejectjoin_Sellerre(HashMap<String, String> map) {
		StringTokenizer st = new StringTokenizer(map.get("sid"),",");
		int result =0; 
		while(st.hasMoreTokens()) {
			result += dao.rejectjoin_Sellerre(st.nextToken());
		}
		return result;
	}

	@Transactional
	@Override //jinwoo
	public int Acsuspensionseller(HashMap<String, String> map) {
		// seller auth권한 삭제, seller_state 0, seller의 product_state 0
		StringTokenizer st = new StringTokenizer(map.get("sid"),",");
		String act=(String)map.get("YN");
		int result =0; 
		while(st.hasMoreTokens()) {
			HashMap<String, String> query = new HashMap<>();  
			String id= st.nextToken();
			query.put("id", id);
			query.put("act", act);
			result += dao.delseller_auth(id);
			result += dao.updateseller_state(query);
			result += dao.updatesellerproduct_state(query);
		}
		return result;
	}

	@Override
	public int Actseller(HashMap<String, String> map) {
		// seller auth권한 부여, seller_state 1, seller의 product_state 1
		StringTokenizer st = new StringTokenizer(map.get("sid"),",");
		String act=(String)map.get("YN");
		int result =0; 
		while(st.hasMoreTokens()) {
			HashMap<String, String> query = new HashMap<>();  
			String id= st.nextToken();
			query.put("id", id);
			query.put("act", act);
			result += dao.join_Sellerauth(id);
			result += dao.updateseller_state(query);
			result += dao.updatesellerproduct_state(query);
		}
		return result;		
	}

	@Override
	public int delseller(HashMap<String, String> map) {
		StringTokenizer st = new StringTokenizer(map.get("sid"),",");
		int result =0; 
		while(st.hasMoreTokens()) {
			result += dao.delseller(st.nextToken());
		}
		return result;		
	}

	@Override
	public int Setenable_customer(HashMap<String, String> map) {
		StringTokenizer st = new StringTokenizer(map.get("id"),",");
		String act=(String)map.get("YN");
		int result =0; 
		while(st.hasMoreTokens()) {
			HashMap<String, String> query = new HashMap<>();  
			String id= st.nextToken();
			query.put("id", id);
			query.put("act", act);
			result += dao.Setenable_customer(query);
		}
		return result;
	}

	@Override
	public int delcustomer(HashMap<String, String> map) {
		StringTokenizer st = new StringTokenizer(map.get("id"),",");
		int result =0; 
		while(st.hasMoreTokens()) {
			result += dao.delcustomer(st.nextToken());
		}
		return result;		
	}
}
