package com.sunstar.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.UserService;

@Controller
public class UserController {

	@Autowired @Qualifier("userservice")
	private UserService service;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping("/RegistrationBuyer")
	public String RegistrationBuyer(Model model) {
		model.addAttribute("contentpage", "registercustomer.jsp");
		return "Registration/register";
	}
	
	@RequestMapping("/registercustomer/info")
	public String registercustomer(Model model) {
		model.addAttribute("contentpage", "registercustomerform.jsp");
		return "Registration/register";
	}
	
	@RequestMapping("/registercustomer/insertcustomer")
	public String insertcustomer(Model model, @ModelAttribute CustomerDTO dto, String tel1,  String tel2,  String email1) {
		dto.setEnable(true);
		dto.setTel(dto.getTel()+"-"+tel1+"-"+tel2);
		dto.setEmail(dto.getEmail()+"@"+email1);
		
		ArrayList<AuthDTO> arr = new ArrayList<AuthDTO>();
		arr.add(new AuthDTO(dto.getId(),"ROLE_USER"));
		dto.setAuthlist(arr);
		service.join_Customer(dto);
		
		//회원가입 email 전송
		  final MimeMessagePreparator pp = new MimeMessagePreparator() { 
		         @Override
		         public void prepare(MimeMessage mimeMessage) throws Exception {
		            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
		            helper.setFrom("wlsdn9489@naver.com");
		            helper.setTo(dto.getEmail());
		            helper.setSubject("[쓰삐제] 회원가입을 환영합니다.");
		            helper.setText("<b>"+dto.getName()+"님 회원가입을 환영합니다.</b>"
		                  + "<br>"
		                  + "<img src="+"https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"+">", true);
		         }
		      };
		  mailSender.send(pp);
	      return "redirect:http://localhost:8080/userlogin";
	}
	
	@RequestMapping("/registercustomer/customeridcheck/{id}")
	@ResponseBody
	public int customerIdCheck(@PathVariable String id) {
		int result = service.customeridcheck(id);
			return result;
	}
	
	@RequestMapping("/registercustomer/customeremailcheck")
	@ResponseBody
	public int customerEmailCheck(@RequestParam HashMap<String, String> map) {
		int result = service.customeremailcheck(map);
		System.out.println(result);
			return result;
	}
	
	@RequestMapping("/userlogin/FindID")
	public String FindID(Model model) {
		model.addAttribute("contentpage", "../User/FindID.jsp");
		return "Registration/register";
	}
	
	@RequestMapping("/userlogin/FindPW")
	public String FindPW(Model model) {
		model.addAttribute("contentpage", "../User/FindPW.jsp");
		return "Registration/register";
	}
	
	@RequestMapping("/userlogin/FindID/FindIdComplete")
	public String FindIdCompIDlete(Model model, @ModelAttribute CustomerDTO dto, String email1) {
		dto.setEmail(dto.getEmail()+"@"+email1);
		HashMap<String, String> map = new HashMap<>();
		map.put("name", dto.getName());
		map.put("email", dto.getEmail());
		CustomerDTO finddto = service.customerfindid(map);
		model.addAttribute("finduser", finddto);
		
		model.addAttribute("contentpage", "../User/FindIdComplete.jsp");
		return "Registration/register";
	}
	/*glglglglglgllg나ㅣ는야 나는야 코딩왕!!!*/ //은별꽃
	@RequestMapping("/userlogin/FindPW/FindPwComplete")
	public String FindIdCompPWlete(Model model, @ModelAttribute CustomerDTO dto, String email1) {
		dto.setEmail(dto.getEmail()+"@"+email1);
		String newpw = ""+(int)(Math.random()*1000000);;

		HashMap<String, String> map = new HashMap<>();
		map.put("id", dto.getId());
		map.put("email", dto.getEmail());
		map.put("newpw", newpw);
		
			//새로운 비밀번호 email전송
			final MimeMessagePreparator pp = new MimeMessagePreparator() { 
		         @Override
		         public void prepare(MimeMessage mimeMessage) throws Exception {
		            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
		            helper.setFrom("wlsdn9489@naver.com");
		            helper.setTo(map.get("email"));
		            helper.setSubject("[쓰삐제] 새로운 비밀번호 입니다.");
		            helper.setText("<b> 새비밀번호 :"+newpw+"</b>"
		                  + "<br>"
		                  + "<img src="+"https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"+">", true);
		         }
		      };
		  mailSender.send(pp);
		
		service.SetNewPassowrd(map);
		model.addAttribute("NewPwuser", map);
		
		model.addAttribute("contentpage", "../User/FindPwComplete.jsp");
		return "Registration/register";
	}
	
	@RequestMapping("/userlogin/getCertificationIDNum")
	@ResponseBody
	public String getCertificationIDNum(Model model, @RequestParam HashMap<String, String> map) {
		String CertificationNum = ""+(int)(Math.random()*1000000);;
		  //아이디 찾기 email 전송
		  final MimeMessagePreparator pp = new MimeMessagePreparator() { 
		         @Override
		         public void prepare(MimeMessage mimeMessage) throws Exception {
		            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
		            helper.setFrom("wlsdn9489@naver.com");
		            helper.setTo(map.get("email"));
		            helper.setSubject("[쓰삐제] 아이디 찾기 용 인증번호입니다.");
		            helper.setText("<b> 인증번호 :"+map.get("CertificationNum")+"</b>"
		                  + "<br>"
		                  + "<img src="+"https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"+">", true);
		         }
		      };
		  mailSender.send(pp);
		  
		return CertificationNum;
	}
	
	@RequestMapping("/userlogin/getCertificationPWNum")
	@ResponseBody
	public String getCertificationPWNum(Model model, @RequestParam HashMap<String, String> map) {
		String CertificationNum = ""+(int)(Math.random()*1000000);;
		map.put("CertificationNum", CertificationNum );
		  //비밀번호 찾기 email 전송
		  final MimeMessagePreparator pp = new MimeMessagePreparator() { 
		         @Override
		         public void prepare(MimeMessage mimeMessage) throws Exception {
		            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
		            helper.setFrom("wlsdn9489@naver.com");
		            helper.setTo(map.get("email"));
		            helper.setSubject("[쓰삐제] 비밀번호 찾기 용 인증번호입니다.");
		            helper.setText("<b> 인증번호 :"+map.get("CertificationNum")+"</b>"
		                  + "<br>"
		                  + "<img src="+"https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"+">", true);
		         }
		      };
		  mailSender.send(pp);
		return CertificationNum;
	}
}
