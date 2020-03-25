package com.sunstar.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;

public class UserLoginSucessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		List<String> authNames = new ArrayList<String>();
		
		auth.getAuthorities().forEach(authority -> {
			authNames.add(authority.getAuthority());			
		});
		
		if(authNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin");
			return;
		} 
		
		if(authNames.contains("ROLE_MANAGER")) {
			response.sendRedirect("/seller/seller");
			return;
		}
		
		if(authNames.contains("ROLE_USER")) {
			response.sendRedirect("/");
			return;
		}
		response.sendRedirect("/");
	}
}
