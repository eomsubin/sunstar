package com.sunstar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{

	public DownloadView() {
		setContentType("application/octet-stream");
		
		/*다운받아주는 화면단에 대한 정보*/
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest requset, HttpServletResponse response)
			throws Exception {
		File file = (File) map.get("downloadFile"); //모델단에 대한 자료
		
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		response.setHeader("content-Disposition", "attachment);filename=\""+URLEncoder.encode(file.getName(),"utf-8")+"\";");
		try(FileInputStream fis = new FileInputStream(file);
				OutputStream out = response.getOutputStream();) {
			FileCopyUtils.copy(fis, out);
			out.flush();
			
		}
	}
}
