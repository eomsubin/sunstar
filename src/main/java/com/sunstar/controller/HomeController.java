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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sunstar.dto.AuthDTO;
import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.NuserDTO;
import com.sunstar.dto.NuserinfoDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.AuthService;
import com.sunstar.service.CartService;
import com.sunstar.service.MainService;
import com.sunstar.service.ProductService;
import com.sunstar.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MainService mainservice;	
		

	@Autowired @Qualifier("userservice")
	private UserService userservice;
	
	@Autowired @Qualifier("AuthService")
	private AuthService authservice;
	
	/*@ResponseBody
	@RequestMapping("/abc")
	public List<CategoryDTO> abc(){
		List<CategoryDTO> list = mainservice.getCategory();
		System.out.println("controller"+list);
		//model.addAttribute("catelist",list);
		
		return list;
		 
	}*/
	
	@RequestMapping("/addr")
	public String addr()
	{
		return "addr";
	}
	
	@RequestMapping("/")
	public String body(Model model, HttpSession session)
	{		         
		
		mainservice.header(model);
		
		List<ProductDTO> fashion = mainservice.getProductList();
		List<CategoryDTO> category=mainservice.getCategory();
		List<ProductDTO> digital = mainservice.getDigital();
		List<ProductDTO> furniture = mainservice.getFurniture();
		List<ProductDTO> food = mainservice.getFood();
		List<ProductDTO> animal = mainservice.getAnimal();
		List<ProductDTO> recommend = mainservice.getRecommend();
		
		model.addAttribute("fashion",fashion);
		model.addAttribute("digital",digital);
		model.addAttribute("furniture",furniture);
		model.addAttribute("food",food);
		model.addAttribute("animal",animal);
		model.addAttribute("recommend",recommend);
		model.addAttribute("category",category);
		model.addAttribute("contentpage", "body.jsp");
		
		return "home";
	}
	
	@GetMapping("/userlogin")
	public void userlogin(HttpSession session, HttpServletRequest request, Model model) throws UnsupportedEncodingException
	{	
		String clientId = "XMKUF7HdU8r3IIu3tMzr";
		String redirectURI = URLEncoder.encode("http://localhost:8080/callback", "UTF-8");
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
	    String redirectURI = URLEncoder.encode("http://localhost:8080/", "UTF-8");
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
  	      	System.out.println(userinfo);
  	      	if(userservice.customeridcheck(userinfo.getResponse().get("id"))<1)
  	      		{
  	      			CustomerDTO dto = new CustomerDTO();
	
	  	      		dto.setId(userinfo.getResponse().get("id"));
	  	      		dto.setPassword(userinfo.getResponse().get("id"));
	  	      		dto.setName(userinfo.getResponse().get("name"));
	  	      		dto.setEmail(userinfo.getResponse().get("email"));
	  	      		dto.setEnable(true);
		  	  		dto.setAddress1(" ");
		  			dto.setAddress2(" ");
		  			dto.setAddress3(" ");
		  			dto.setZip(" ");
		  			dto.setTel(" ");
	  	      		ArrayList<AuthDTO> auth = new ArrayList<AuthDTO>();
	  	      		auth.add(new AuthDTO(dto.getId(),"ROLE_USER"));
	  	      		dto.setAuthlist(auth);
	  	      		
	  	      		userservice.join_Customer(dto);
  	      		};
  	      	/*String error="";
  	      	if(!userinfo.getResponse().containsKey("name")) {
  	      		error="이름";
  	      	}else if(!userinfo.getResponse().containsKey("email"))
  	      	{
  	      		error="이메일";	
  	      	}else if(!userinfo.getResponse().containsKey("nickname"))
  	      	{
  	      		error="별명";
  	      	}else if(!userinfo.getResponse().containsKey("profile_image"))
  	      	{
  	      		error="프로필사진";
  	      	}else if(!userinfo.getResponse().containsKey("gender"))
  	      	{
  	      		error="성별";
  	      	}else if(!userinfo.getResponse().containsKey("birthday"))
  	      	{
  	      		error="생일";
  	      	}else if(!userinfo.getResponse().containsKey("age"))
  	      	{
  	      		error="연령대";
  	      	}
  	      	if(!(error.equals(""))) {
  	      		apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
  	      		apiURL += "&client_id=" + clientId;
  	      		apiURL += "&state=" + state;
  	      		apiURL += "&redirect_uri=" + redirectURI;
  	      		apiURL += "&auth_type=reprompt";
  	      		System.out.println(apiURL);
  	      		return "redirect:"+apiURL;
  	      	}*/
  	      session.setAttribute("user", user);
  	      /*session.setAttribute("userinfo", userinfo);*/
  	      	session.setAttribute("naverlogin", userinfo.getResponse().get("id"));
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		return "redirect:http://localhost:8080/userlogin";
	}
	
	
	
	
	@GetMapping("/userlogout") 
	public void userlogout(HttpSession session) throws NullPointerException 
	{
		NuserDTO user = (NuserDTO)session.getAttribute("user");
		if(user!=null) //접근 토큰 삭제 요청, 연동 취소
		{
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
		}
		session.removeAttribute("user");
		/*session.removeAttribute("userinfo");*/
		}
		/*session.invalidate();*/
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
	
	//사이트맵
	@RequestMapping("/sitemap")
	public String sitemap(Model model) {
		mainservice.header(model);
		
		model.addAttribute("contentpage", "sitemap.jsp");
		
		return "home";
	}
}
