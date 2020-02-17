package com.sunstar.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/main/{page}", method = RequestMethod.GET)
	public String home(@PathVariable String page, Model model) {
		model.addAttribute("contentpage", page);
		return "home";
	}

	@RequestMapping("/")
	public String main(Model model)
	{
		model.addAttribute("contentpage", "body");
		return "home";
	}

	@RequestMapping("/body")
	public String body(Locale locale, Model model)
	{
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );		

		return "body";
	}

	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}

	@RequestMapping("/callback")
	public String callback(HttpSession session) {
		return "callback";
	}
	
	@ResponseBody
	@RequestMapping("/loginNaver")
	public void loginNaver(HashMap<String, String> user, String age){
		System.out.println(user);
		System.out.println(age);
		System.out.println("¹Ùº¸");
	}
}
