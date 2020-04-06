package com.sunstar.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sunstar.dto.AccountsDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.MailDTO;
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
		
		HashMap<String, String> map = new HashMap<>();
		List<HashMap<String, String>> apply = adminservice.getSellerApply(map);
		model.addAttribute("applynum",apply.size());
		
		List<HashMap<String, String>> slist = adminservice.getSellerList(map);
		model.addAttribute("sellernum",slist.size());
		
		List<HashMap<String, Object>> clist = adminservice.getCustomerList(map);
		model.addAttribute("customernum",clist.size());
					
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
	public String seller_submit(Model model, @RequestParam HashMap<String, String> map) throws Exception{
		System.out.println(map);
		//승인
		if(((String)map.get("YN")).equals("submit")) {
			// 권한 등록 
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
			return "redirect:/admin/seller_apply";
		//end 승인
		//반려
		}else if(((String)map.get("YN")).equals("reject")){
			// seller 등록정보 삭제
			userservice.rejectjoin_Sellerre(map);
			// 메일 전송 반복문
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
			return "redirect:/admin/seller_apply";
		//end 반려
		//계정 정지
		}else if(((String)map.get("YN")).equals("stop")){
			// seller auth권한 삭제, seller_state 0, seller의 product_state 0
			userservice.Acsuspensionseller(map);
		//end 계정정지
		//계정 활동
		}else if(((String)map.get("YN")).equals("activity")){
			// seller auth권한 부여, seller_state 1, seller의 product_state 1
			userservice.Actseller(map);
		//end 계정활동
		//seller 계정삭제
		}else if(((String)map.get("YN")).equals("remove")){
			userservice.delseller(map);
			
		}	
		//end seller 계정삭제
		
		return "redirect:/admin/seller_list";
	}
	
	@RequestMapping("/seller_list")			
	public String seller_list(Model model) {
		model.addAttribute("adminpage", "seller_list.jsp");
		HashMap<String, String> map = new HashMap<>();
		List<HashMap<String, String>> list = adminservice.getSellerList(map);
		model.addAttribute("list",list);
		return "admin/temp";
	}
	
	@RequestMapping("/customer_list")			
	public String customer_list(Model model) {
		model.addAttribute("adminpage", "customer_list.jsp");
		HashMap<String, String> map = new HashMap<>();
		List<HashMap<String, Object>> list = adminservice.getCustomerList(map);
		model.addAttribute("list",list);
		return "admin/temp";
	}
	
	@RequestMapping("/sellerExcel/{id}/{act}")
	public void sellerExcel(Model model, HttpServletResponse response, @PathVariable String id, @PathVariable String act) throws Exception{
		List<HashMap<String, Object>> list = new ArrayList<>();
		if(act.equals("1")){
				list= adminservice.getCSellerList(id);
		}else if(act.equals("2")) {
			list = adminservice.getCSellerprduct(id);
		}else if(act.equals("3")) {
			list = adminservice.getCSellerordered(id);
		}
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("판매자 목록");
		Row row = null;
		Cell cell = null;
		int nowNum = 0;
		
		CellStyle headStyle = wb.createCellStyle();
		
		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.
		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);	
		// 데이터용 경계 스타일 테두리만 지정
		
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		// 헤더 생성
		
		HashMap<String, Object> item = list.get(0);
		Iterator<String> keyita = item.keySet().iterator();
		List<String> keylist = new ArrayList<String>();
		
		while(keyita.hasNext())
		{
			keylist.add(keyita.next());
		}
		
		row = sheet.createRow(nowNum++);
		int index=0;
		for(String key : keylist)
		{
			cell = row.createCell(index++);
			cell.setCellStyle(headStyle);
			cell.setCellValue(key);
		}
		
		for(HashMap<String, Object> map : list)
		{			
			index=0;
			row = sheet.createRow(nowNum++);
			for(String key : keylist) {
				cell = row.createCell(index++);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(""+map.get(key));
				}
		}
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		
		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");

		Date date = new Date();

		String time1 = frm.format(date);

		String filename = "attachment;filename="+time1+".xls";

		response.setHeader("Content-Disposition", filename );

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	@RequestMapping("/category")
	public String category(Model model
							 ) {
		
		
	
		
		List<CategoryDTO> lv1 = adminservice.getLv1();
		List<CategoryDTO> lv2= adminservice.getLv2();
		List<CategoryDTO > lv3= adminservice.getLv3();
		
		model.addAttribute("lv1",lv1);
		model.addAttribute("lv2",lv2);
		model.addAttribute("lv3",lv3);
		model.addAttribute("adminpage", "category.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/add_lv2/{lv1_val}/{lv2_name}/{lv3_name}")
	public String add_lv2(@PathVariable String lv1_val,@PathVariable String lv2_name,@PathVariable String lv3_name) {
		
		System.out.println(lv1_val+"  "+lv2_name);
		System.out.println(lv3_name);
		CategoryDTO cdto = new CategoryDTO();
		cdto.setLv1(lv1_val);
		cdto.setLv2(lv2_name);
		cdto.setLv3(lv3_name);
		
		adminservice.add_lv2(cdto);
		
		
		return "redirect:/admin/category";
	}
	
	@RequestMapping("/add_lv3/{level1}/{level2}/{lev3_name}")
	public String add_lv3(@PathVariable String level1,@PathVariable String level2,@PathVariable String lev3_name) {
		
		CategoryDTO cdto = new CategoryDTO();
		cdto.setLv1(level1);
		cdto.setLv2(level2);
		cdto.setLv3(lev3_name);
		
		adminservice.add_lv3(cdto);
		
		return "redirect:/admin/category";
	}
	
	@RequestMapping("/droplv2/{lv2}")
	public String droplv2(@PathVariable String lv2) {
		
		CategoryDTO cdto =new CategoryDTO();
		cdto.setLv2(lv2);
		
		adminservice.droplv2(cdto);
		
		return "redirect:/admin/category";
	}
	@RequestMapping("/droplv3/{lv3}")
	public String droplv3(@PathVariable String lv3) {
		CategoryDTO cdto = new CategoryDTO();
		
		cdto.setLv3(lv3);
		adminservice.droplv3(cdto);
		
		return "redirect:/admin/category";
	}
	
	
	@RequestMapping("/oneforone")
	public String oneforone(Model model) {
		
		
		List<MailDTO> mlist = adminservice.getMails();
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("adminpage", "oneforone.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/sendmail")
	public String sendmail(MailDTO dto) {
		
		System.out.println(dto);
		
		adminservice.updateReply(dto);
		
		//메일전송
		  final MimeMessagePreparator pp = new MimeMessagePreparator() {
	         
	         @Override
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
	            helper.setFrom("wlsdn9489@naver.com");
	            helper.setTo("choi-solyi@naver.com");
	            helper.setSubject("1:1문의에 대한답변입니다.");
	            helper.setText("<b><p>"+ "안녕하세요.스삐제에 문의해주셔서 감사합니다. <br> 문의사항에 대한 답변입니다."+ "</p></b>"
	            		+ dto.getReply()+ "</b>"
	                  + "<br>"
	                  + "<img src="+"http://choisolyi.dothome.co.kr/img/thankyou.jpg"+">", true);
	         }
	      };
	      
	      mailSender.send(pp);

		
		return "redirect:/admin/oneforone";
	}
	
	@RequestMapping("/settings")
	public String settings(Model model) {
		
		
		model.addAttribute("adminpage", "settings.jsp");
		return "admin/temp";
	}
	
	@RequestMapping("/acc")
	public String acc(Model model) {
		
		
		List<AccountsDTO> alist = adminservice.getAccList();
		System.out.println(alist);
		
		model.addAttribute("alist", alist);

		model.addAttribute("adminpage", "acc.jsp");

		return "admin/temp";
	}
	
	
	@RequestMapping("/accUpdate/{seller_code}/{yymm}")
	public String accUpdate( @PathVariable String seller_code, @PathVariable String yymm) {
		
		AccountsDTO dto = new AccountsDTO();
		dto.setSeller_code(seller_code);
		dto.setYyyymm(yymm);
		adminservice.updateAccList(dto);
		return "redirect:/admin/acc";

	}
   
}