package com.sunstar.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sunstar.dto.NuserDTO;
import com.sunstar.dto.NuserinfoDTO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/header")
	public String header()
	{
		return "header";
	}

	@RequestMapping("/footer")
	public String footer()
	{
		return "footer";
	}

	@RequestMapping("/")
	public String body(Locale locale, Model model, HttpSession session)
	{
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );		        
		model.addAttribute("contentpage", "body.jsp");
		return "home";
	}
	@RequestMapping("/main")
	public String body( Model model, HttpSession session)
	{
		


		
		        
		model.addAttribute("contentpage", "main.jsp");
		return "home";
	}
	
	

	@GetMapping("/userlogin")
	public void userlogin(HttpSession session, HttpServletRequest request, Model model) throws UnsupportedEncodingException
	{
		String clientId = "XMKUF7HdU8r3IIu3tMzr";
		String redirectURI = URLEncoder.encode("http://localhost:8080/controller/callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		request.setAttribute("apiURL", apiURL);
		//model.addAttribute("contentpage", "login.jsp");
	}

	@RequestMapping("/callback")
	public String callback(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException
	{
		//네이버 로그인 접근토큰 획득
		String clientId = "XMKUF7HdU8r3IIu3tMzr";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "huGfQG5ZGT";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");// 인증코드
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/controller/", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      if(responseCode==200) {
	        System.out.println(res.toString());
	        NuserDTO user = new ObjectMapper().readValue(res.toString(), NuserDTO.class);
	        
	        // 네이버 API - 회원프로필 조회
	        String token = user.getAccess_token();
	        String header = "Bearer " + token;
	        apiURL = "https://openapi.naver.com/v1/nid/me";
	        url = new URL(apiURL);
	        con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            responseCode = con.getResponseCode();
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            res = new StringBuffer();
  	      while ((inputLine = br.readLine()) != null) {
  	        res.append(inputLine);
  	      }
  	      	NuserinfoDTO userinfo = new ObjectMapper().readValue(res.toString(), NuserinfoDTO.class);
  	      session.setAttribute("user", user);
  	      session.setAttribute("userinfo", userinfo);
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return "redirect:http://localhost:8080/controller/";
	}
	
	@GetMapping("/userlogout")
	public void userlogout(HttpSession session) 
	{
		/*//접근 토큰 삭제 요청, 연동 취소
		NuserDTO user = (NuserDTO)session.getAttribute("user");
		 String apiURL;
		 apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
		 apiURL += "client_id=XMKUF7HdU8r3IIu3tMzr";
		 apiURL += "&client_secret=huGfQG5ZGT";
		 apiURL += "&access_token="+user.getAccess_token();
		 apiURL += "&service_provider=NAVER";
		 System.out.println(apiURL);
		 try {
		 URL url = new URL(apiURL);
	     HttpURLConnection con = (HttpURLConnection)url.openConnection();
	     con.setRequestMethod("GET");
	     int responseCode = con.getResponseCode();
	     BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println(res.toString());
	      }
		 }catch(Exception e) {
			 System.out.println(e);
		}*/
		
		session.invalidate();
	}
	
	@RequestMapping("/admin")
	public String admin()
	{
		return "admin";
	}
	
	@RequestMapping("/manager")
	public String manager()
	{
		return "manager";
	}
	
	@RequestMapping("/member")
	public String member()
	{
		return "member";
	}
	
	@RequestMapping("/all")
	public String all()
	{
		return "all";
	}
	
	@RequestMapping("/error")
	public String error()
	{
		return "error";
	}
	@RequestMapping("/customer")
	public String customer()
	{
		return "customer";
	}
}

