package com.sunstar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mysql.cj.protocol.x.Notice;
import com.sunstar.dto.FaqDTO;
import com.sunstar.dto.MailDTO;
import com.sunstar.dto.NoticeDTO;

@Mapper
public interface CSMapper {

	int inquiryadd(MailDTO dto);

	List<MailDTO> inquirylist(String id);

	int noticeadd(NoticeDTO dto);

	List<NoticeDTO> noticelist();

	boolean delnotice(String notice_no);

	List<FaqDTO> faqlist();

	int faqadd(FaqDTO dto);

	boolean faqdel(String faq_no);
}
