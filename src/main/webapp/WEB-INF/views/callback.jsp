<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
    String clientId = "XMKUF7HdU8r3IIu3tMzr";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "huGfQG5ZGT";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");// 인증코드
 	// 상태 토큰에 대한 검증이 성공적으로 끝났다면 응답으로 전달받은 인증 코드를 이용해 최종 인증 값인 접근 토큰을 발급받습니다.
 	// 인증 코드는 접근 토큰을 발급할 때 1번만 사용하며 이미 사용한 인증 코드는 더 이상 사용할 수 없습니다.
 	
    String state = request.getParameter("state");// 상태 토큰
 	// 콜백으로 전달받은 상태 토큰. 애플리케이션이 생성한 상태 토큰과 일치해야 합니다. //String storedState = (String) request.getSession().getAttribute("state");
    
    String redirectURI = URLEncoder.encode("http://localhost:8080/controller/", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
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
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
</body>
</html>
