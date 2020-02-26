package com.sunstar.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomerUserDetail implements UserDetails {

	private CustomerDTO dto;
	public CustomerUserDetail(CustomerDTO dto) {
		this.dto = dto;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<AuthDTO> list = dto.getAuthlist();
		ArrayList<SimpleGrantedAuthority> auth = new ArrayList<>();
		for(int i=0;i<list.size();i++)
			auth.add(new SimpleGrantedAuthority(list.get(i).getAuth()));
		return auth;
	}

	
	public CustomerDTO getUserInfo() {
		return dto;
	}
	
	public String getId() {
		return dto.getName();
	}
	
	public String getTel() {
		return dto.getTel();
	}
	
	public String getEmail() {
		return dto.getEmail();
	}
	
	public String getAddress1() {
		return dto.getAddress1();
	}
	
	public String getAddress2() {
		return dto.getAddress1();
	}
	
	public String getAddress3() {
		return dto.getAddress1();
	}
	
	public String getZip() {
		return dto.getZip();
	}
	
	public String getJoin_date() {
		return dto.getJoin_date();
	}
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return dto.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return dto.getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnable();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return dto.isEnable();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnable();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return dto.isEnable();
	}
}
