package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sunstar.dto.NoticeDTO;

@Mapper
public interface CSMapper {

	List<NoticeDTO> noticeList();
}
