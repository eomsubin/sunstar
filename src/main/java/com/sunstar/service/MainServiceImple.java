package com.sunstar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.mapper.Homemapper;

@Service("mainservice")
public class MainServiceImple implements MainService {
	@Autowired
	private Homemapper homemapper;
	
	@Override
	public List<CategoryDTO> getCategory() {
		System.out.println("serviceimple"+ homemapper.getCategory());

		return homemapper.getCategory();
	}

	@Override
	public List<CategoryDTO> getCategory2() {
		// TODO Auto-generated method stub
		return homemapper.getCategory2();
	}
	
	
	
}
