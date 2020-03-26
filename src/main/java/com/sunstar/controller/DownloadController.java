package com.sunstar.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController implements ApplicationContextAware{

	private ApplicationContext context = null;
	
	@RequestMapping(value="/download/{path:.+}")
	public ModelAndView download( @PathVariable("path") String path, HttpServletRequest request ) {
		String folder = "resources\\";
		String fullpath = request.getSession().getServletContext().getRealPath(folder+"/"+path);
		File f = new File(fullpath);
		return new ModelAndView("download", "downloadFile", f);
		
	}
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		
		this.context = context;
		
	}

}
