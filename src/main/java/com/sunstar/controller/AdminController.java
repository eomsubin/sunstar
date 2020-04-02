package com.sunstar.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.service.AdminService;
import com.sunstar.service.FileUploadService;
import com.sunstar.service.UserService;

@Controller @RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	@Qualifier("userservice")
	private UserService userservice;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	public String getId( Model model, Principal principal) {
		String id = "";
		if(principal!=null) {
			id= principal.getName();
			System.out.println(id);
		}
		return id;
	}

	
	@RequestMapping("/index")
	public String index(Model model) {
		
		model.addAttribute("adminpage", "temp_main.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/seller_apply")
	public String seller_apply(Model model) {
		model.addAttribute("adminpage", "seller_apply.jsp");
		HashMap<String, String> map = new HashMap<>();
		List<HashMap<String, String>> apply = adminservice.getSellerApply(map);
		model.addAttribute("list",apply);
		return "admin/temp";
	}
	
	@RequestMapping("/seller_submit")
	public String seller_submit(Model model, @RequestParam HashMap<String, String> map) {
		System.out.println(map);
		
		
		if(((String)map.get("YN")).equals("submit")) {
			//권한 등록
			userservice.join_Sellerauth(map);

			// 메일 전송 반복문			
			StringTokenizer st = new StringTokenizer(map.get("email"),",");
			while(st.hasMoreTokens()) {
			final MimeMessagePreparator pp = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
					helper.setFrom("wlsdn9489@naver.com");
					helper.setTo(st.nextToken());
					helper.setSubject("[쓰삐제] 판매자 신청이 승인되었습니다.");
					helper.setText("<b> 축하합니다. 판매자 회원이 승인되었습니다. </b>" + "<br>" + "<img src="
							+ "https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"
							+ ">", true);
				};
			
			};
			mailSender.send(pp);
			};
			//반려
		}else {
			userservice.rejectjoin_Sellerre(map);
			StringTokenizer st = new StringTokenizer(map.get("email"),",");
			while(st.hasMoreTokens()) {
			final MimeMessagePreparator pp = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
					helper.setFrom("wlsdn9489@naver.com");
					helper.setTo(st.nextToken());
					helper.setSubject("[쓰삐제] 판매자 신청이 반려되었습니다.");
					helper.setText("<b> 죄송합니다. 판매자 회원이 승인반려되었습니다. </b>" + "<br> 사유 : "+((String)map.get("m")) + "<br>" +"<img src="
							+ "https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"
							+ ">", true);
				};
			};
			mailSender.send(pp);
			};
		}
		
		return "redirect:/admin/seller_apply";
	}
	
	@RequestMapping("/seller_list")			
	public String seller_list(Model model) {
		model.addAttribute("adminpage", "seller_list.jsp");
		HashMap<String, String> map = new HashMap<>();
		List<HashMap<String, String>> list = adminservice.getSellerList(map);
		model.addAttribute("list",list);
		return "admin/temp";
	}
	
	@RequestMapping("/category")
	public String category(Model model) {
		
		List<CategoryDTO> lv1 = adminservice.getLv1();
		
		model.addAttribute("adminpage", "category.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/oneforone")
	public String oneforone(Model model) {
		model.addAttribute("adminpage", "oneforone.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/settings")
	public String settings(Model model) {
		
		
		model.addAttribute("adminpage", "settings.jsp");
		return "admin/temp";
	}
	

	
	
	
}
