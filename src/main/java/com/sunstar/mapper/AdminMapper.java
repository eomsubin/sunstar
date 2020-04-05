package com.sunstar.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.AccountsDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MailDTO;

@Mapper
public interface AdminMapper {

	public List<HashMap<String, String>> getSellerApply(HashMap<String, String> map); //jinwoo
	public List<HashMap<String, String>> getSellerList(HashMap<String, String> map); //jinwoo
	public List<HashMap<String, Object>> getCSellerList(List<String> list); //jinwoo
	public List<HashMap<String, Object>> getCSellerprduct(List<String> list); // jinwoo
	public List<HashMap<String, Object>> getCSellerordered(List<String> idl); // jinwoo

	
	public List<CategoryDTO> getLv1();
	public List<CategoryDTO> getLv2(CategoryDTO lv1data);
	public List<CategoryDTO> getLv2(String lv1select);
	public List<CategoryDTO> getLv3(String lv2select);
	public List<CategoryDTO> getLv2();
	public List<CategoryDTO> getLv3();
	public void add_lv2(CategoryDTO cdto);
	public void add_lv3(CategoryDTO cdto);
	
	//∏ﬁ¿œ
	public List<MailDTO> getMails();
	public void updateReply(MailDTO dto);
	public List<AccountsDTO> getAccList();
	
}
