package com.sunstar.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

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
import org.apache.poi.ss.util.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.google.api.client.util.Data;
import com.mysql.cj.xdevapi.JsonArray;
import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ChartDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.QnaDTO;
import com.sunstar.dto.ReviewDTO;
import com.sunstar.dto.ReviewImgDTO;
import com.sunstar.dto.SellerDTO;
import com.sunstar.dto.DataDTO;
import com.sunstar.dto.MakePage;
import com.sunstar.service.FileUploadService;
import com.sunstar.service.SellerService;

@RequestMapping("/seller/*")
@Controller
public class SellerController {

	@Autowired
	private SellerService sellerservice;
	@Autowired
	private FileUploadService fileservice;

	public String getId( Model model, Principal principal) {
		String id = "";
		if(principal!=null) {
			id= principal.getName();

			System.out.println(id);
		}
		return id;
	}


	@RequestMapping("/seller")
	public String seller(Model model,  Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		int paid = sellerservice.getPaid(seller_code);
		int ready = sellerservice.getReadyCount(seller_code);
		int exchange =  sellerservice.getExchangeCount(seller_code);
		int bringBack = sellerservice.getBringBack(seller_code);
		int waitAnswer = sellerservice.getWaitAnswer(seller_code);


		System.out.println(ready + "/" + exchange + "/" + bringBack + "/" + waitAnswer);

		model.addAttribute("paid", paid);
		model.addAttribute("ready", ready);
		model.addAttribute("exchange", exchange);
		model.addAttribute("bringback", bringBack);
		model.addAttribute("waitAnswer",waitAnswer);

		model.addAttribute("sellerpage", "temp_main.jsp");
		return "sellers/temp";
	}

	//상품 목록 보기
	@RequestMapping("/productlist")
	public String product(Model model, Principal principal,
			@RequestParam(required=false, defaultValue="1")int currPage,
			@RequestParam(required=false, defaultValue="10")int psize,
			@RequestParam(required=false, defaultValue="")String txt
			) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);

		String seller_code = sellerservice.getSellerCode(id);


		//페이징 및 검색
		/*		Pattern p = Pattern.compile("(^[0-9]*$)");

		if(txt != null || !txt.equals("")) {
			Matcher m = p.matcher(txt);
			if(!m.find()) {
				txt="";
				model.addAttribute("txt", txt);
			}else {
				model.addAttribute("txt",txt);
			}
		}*/

		//총 갯수 구하기
		int totalCount = sellerservice.totalCount(txt);
		System.out.println(totalCount);

		MakePage pa = new MakePage();
		pa.setSizePerPage(10); 
		if(psize == 0 ) {
			pa.setSizePerPage(10); 
		}else {
			pa.setSizePerPage(psize); 
		}

		int blockSize = 10;
		MakePage page = new MakePage(currPage, totalCount, pa.getSizePerPage(), blockSize);


		System.out.println(page.getStartRow());
		System.out.println(page.getEndRow());
		int a = ( page.getStartRow()  );


		page.setStartRow(a);

		System.out.println("입력psize: "+ psize);

		System.out.println(page.getSizePerPage());
		//	List<ProductDTO> list = sellerservice.productlist(category, txt, page.getStartRow(), page.getEndRow() );


		System.out.println("======page======");

		page.setStartRow(page.getStartRow());

		System.out.println("현재페이지"+page.getCurrPage());
		System.out.println("총 갯수"+page.getTotalCount());
		System.out.println("1페이지당 표시개수"+page.getSizePerPage());
		System.out.println("블럭사이즈"+page.getBlockSize());
		System.out.println("시작줄"+page.getStartRow());
		System.out.println("끝줄"+page.getEndRow());
		System.out.println("시작블럭"+page.getStartBlock());
		System.out.println("끝블럭"+page.getEndBlock());
		System.out.println("이전있니"+page.isPrev());
		System.out.println("다음있니"+page.isNext());
		System.out.println("======page==end===");

		page.setSeller_code(seller_code);

		List<ProductDTO> list = sellerservice.productlist(page);


		//	System.out.println("list ::"+list );
		model.addAttribute("list", list);

		model.addAttribute("page", page);


		//페이징 및  끝

		model.addAttribute("sellerpage", "productlist.jsp");
		return "sellers/temp";
	}

	//상품 상세보기
	/*	@ResponseBody
	@RequestMapping("/detailview/{pcode}")
	public ProductDTO detailview(@PathVariable String pcode) {

		int pcd = Integer.parseInt(pcode);

		List<ProductDTO> dto = sellerservice.viewProduct(pcd);
		System.out.println(dto);

		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO a : clist) {
			a.setLv123(a.getLv1()+" - "+a.getLv2()+" - "+a.getLv3()); 
			dlist.add(a);
			//dto.setCategorydto(dlist);
		}
		return dto;
	}*/


	@RequestMapping("/changePublicState/{changePublicState}/{pcodes}")
	public String changePublicState(@PathVariable String changePublicState, @PathVariable String pcodes) {
		String[] pcode = pcodes.split(",");
		System.out.println(changePublicState);

		for(String i : pcode) {
			ProductDTO dto = new ProductDTO();

			dto.setProduct_code(Integer.parseInt(i));

			if("publicStateTrue".equals(changePublicState)) {
				dto.setPublic_state(true);
				sellerservice.changePublicState(dto); 

			}else if("publicStateFalse".equals(changePublicState)) {
				dto.setPublic_state(false);
				sellerservice.changePublicState(dto); 

			}else if("reviewStateTrue".equals(changePublicState)) {
				dto.setReview_state(true);
				sellerservice.changeReviewState(dto); 

			}else if("reviewStateFalse".equals(changePublicState)) {
				dto.setReview_state(false);
				sellerservice.changeReviewState(dto); 
			}
		}
		return "redirect:/seller/productlist";
	}

	//상품목록 출력
	@RequestMapping(value="/productExcel/")
	public void productExcel(HttpServletResponse response) throws Exception{
		List<ProductDTO> productList = new ArrayList<>();


		String seller_code = "11111";
		//	productList = sellerservice.list(seller_code);   //변경해야돼!!!!!!@@@@
		productList = sellerservice.list();

		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("상품 목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;


		// 테이블 헤더용 스타일
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

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품코드");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품이름");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("가격");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("원가");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("배송비");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("옵션1");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("옵션2");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("재고");
		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("추가금액");
		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품공개여부");
		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("리뷰공개여부");

		// 데이터 부분 생성

		for(ProductDTO dto : productList) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getProduct_code());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getProduct_name());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getPrice());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getCost());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getShipping_cost());

			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getOption1());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getOption2());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getInventory());
			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getAdd_price());



			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			String public_state = "";
			if(dto.isPublic_state()==true) {
				public_state = "공개";
			}else {
				public_state = "비공개";
			}
			cell.setCellValue(public_state);


			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);

			String review_state = "";
			if(dto.isPublic_state()==true) {
				review_state = "공개";
			}else {
				review_state = "비공개";
			}
			cell.setCellValue(review_state);
		}
		// 컨텐츠 타입과 파일명 지정

		response.setContentType("ms-vnd/excel");
		int a = 2;
		String b = Integer.toString(a);


		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");

		Date date = new Date();

		String time1 = frm.format(date);

		String filename = "attachment;filename="+time1+".xls";

		response.setHeader("Content-Disposition", filename );

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}


	//상품 추가 하기
	@RequestMapping("/addproduct")
	public String addproduct(Model model, Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		model.addAttribute("seller_code", seller_code);

		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);

		//기본배송비 불러오기
		SellerDTO dto = sellerservice.sellerInfo(seller_code);
		String basic_shipping_cost = dto.getBasic_shipping_cost();


		model.addAttribute("shipping_cost", basic_shipping_cost);



		model.addAttribute("sellerpage", "addsproduct.jsp");
		return "sellers/temp";
	}

	//상품 추가 결과
	@RequestMapping(value = "/addproductresult", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String addproductresult(HttpServletRequest request, ProductDTO dto, HttpServletRequest req, Model model) {

		//multipart 파일을 multi에 담아줌
		MultipartFile multi = dto.getAthumb_img();
		MultipartFile multi1 = dto.getAdetail_img1();		
		MultipartFile multi2 = dto.getAdetail_img2();
		MultipartFile multi3 = dto.getAdetail_img3();


		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String time1 = frm.format(date);
		String thumb = "thumb_"+time1+".jpg";
		String detail1 = "detail1_" + time1+".jpg";
		String detail2 = "detail2_" + time1+".jpg";
		String detail3 = "detail3_" + time1+".jpg";

		String path = "resources\\product_img";


		try {
			//저장 경로 구하기
			String uploadpath = request.getSession().getServletContext().getRealPath(path);
			System.out.println(uploadpath);

			//파일이 비어있지 않다면!
			if(!multi.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);
				String new_file_url_name = uploadpath+"/"+thumb;
				File file2 = new File(new_file_url_name);
				file.renameTo(file2);
				dto.setThumb_img("resources\\product_img\\" + thumb);
			}
			if(!multi1.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file1 = new File(uploadpath, multi1.getOriginalFilename());
				multi1.transferTo(file1);
				String new_file_url_name = uploadpath+"/"+detail1;
				File nfile1 = new File(new_file_url_name);
				file1.renameTo(nfile1);
				dto.setDetail_img1("resources\\product_img\\" + detail1);
			}

			if(!multi2.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file2 = new File(uploadpath, multi2.getOriginalFilename());
				multi2.transferTo(file2);
				String new_file_url_name = uploadpath+"/"+detail2;
				File nfile2 = new File(new_file_url_name);
				file2.renameTo(nfile2);
				dto.setDetail_img2("resources\\product_img\\" + detail2);
			}

			if(!multi3.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file3 = new File(uploadpath, multi3.getOriginalFilename());
				multi3.transferTo(file3);
				String new_file_url_name = uploadpath+"/"+detail3;
				File nfile3 = new File(new_file_url_name);
				file3.renameTo(nfile3);
				dto.setDetail_img3("resources\\product_img\\" + detail3);
			}


		}catch(IOException e){
			e.getMessage();

		}
		sellerservice.addProduct(dto);
		System.out.println(dto);


		System.out.println(dto.getExplains());

		return "redirect:/seller/productlist";
	}

	//상품 삭제
	@RequestMapping("/deleteproduct/{pcode}")
	public String deleteproduct(@PathVariable int pcode ) {

		sellerservice.deleteProduct(pcode);
		return "redirect:/seller/productlist";
	}


	private List<Integer> plist = new ArrayList<>();

	//상품 수정  //일괄 업데이트 테스트하다가 일시중지
	@RequestMapping("/updateinventory/{pcode}/{gesu}")
	public String updateinventory(@PathVariable int pcode, @PathVariable int gesu){

		Object a = (Object)pcode;

		if(!plist.contains(a)) {
			plist.add(pcode);
			System.out.println("성공" + pcode);
		}else {
			System.out.println("실패" + pcode);
		}


		System.out.println("size: "+plist.size());

		for(int i=0;i<plist.size();i++) {
			System.out.println("index  -------- "+i);
			System.out.println("value ----------"+plist.get(i));
		}

		/*System.out.println("////");
		System.out.println(plist);
		System.out.println("////");
		for(int i=0;i<plist.size();i++) {

			int product = plist.get(i);		
			List<String> color = sellerservice.getOptioncolor(product);

			for(String aaa : color) {
				System.out.println("--------------시작--");
				System.out.println(pcode);
				System.out.println(aaa);
				System.out.println("---------------끝-");
				OptionDTO dto = new OptionDTO();
				dto.setProduct_code(pcode);
				dto.setInventory(gesu);
				dto.setColor(aaa);
				sellerservice.updateinventory(dto);
			}
		}*/

		//	System.out.println("-----------pcode---시작--");
		//	System.out.println(pcode);
		//	System.out.println("-----------pcode----끝-");


		//	List<String> color = sellerservice.getOptioncolor(pcode);

		//	System.out.println("color 출력" + color);	*/
		/*	for(String a : color) {
			System.out.println("--------------시작--");

			System.out.println(pcode);
			System.out.println(a);
			System.out.println("---------------끝-");
			OptionDTO dto = new OptionDTO();
			dto.setProduct_code(pcode);
			dto.setInventory(gesu);
			dto.setColor(a);
			sellerservice.updateinventory(dto);
		}*/

		return "redirect:/seller/productlist";
	}


	//주문 목록
	@RequestMapping("/orders")
	public String orders(Model model, Principal principal) {

		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		List<OrderDTO> orderlist = sellerservice.orderlist(seller_code);
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("sellerpage", "orders.jsp");
		return "sellers/temp";

	}

	//주문목록 출력
	@RequestMapping(value="/orderexcel/{state}")
	public void orderexcel(HttpServletResponse response, @PathVariable String state, Model model, Principal principal) throws Exception{

		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);


		List<OrderDTO> orderlist = new ArrayList<>();

		String[] data = state.split(",");

		System.out.println("state"+state);
		System.out.println("data"+data.toString());


		//배송대기 출력
		if("shipping_list".equals(state)) {
			orderlist =  sellerservice.shippinglist(seller_code);

			//전체출력
		}else if("all".equals(state)){
			orderlist = sellerservice.orderlist(seller_code);

			//선택한 값 출력
		}else {
			for(String order_no : data) {	     
				System.out.print("order_no : ");
				System.out.println(order_no);
				orderlist.add(sellerservice.theOrderlist(order_no));
			}
		}

		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("주문 목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;


		// 테이블 헤더용 스타일
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

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("상품코드");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("옵션");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("구매수량");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("금액");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("특이사항");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("결제방법");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("구매자 이름");
		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연락처");
		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("배송지");
		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("우편번호");
		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주문 상태");


		// 데이터 부분 생성

		for(OrderDTO dto : orderlist) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getOrder_code());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getProduct_code());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getOption1()+"/"+dto.getOption2()+"/");

			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getQuantity());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getPrice());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getMessage());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getOrder_way());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getName());
			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getTel());



			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getShipping_addr1()+" "+dto.getShipping_addr2()+" "+dto.getShipping_addr3());
			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getShipping_zip());
			cell = row.createCell(11);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getDelivery_state());

		}
		// 컨텐츠 타입과 파일명 지정

		response.setContentType("ms-vnd/excel");
		int a = 2;
		String b = Integer.toString(a);


		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");

		Date date = new Date();

		String time1 = frm.format(date);

		String filename = "attachment;filename="+time1+".xls";

		response.setHeader("Content-Disposition", filename );

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

	//주문목록 단계변경
	@RequestMapping("/view_step/{stp}")
	public String viewStep(Model model, @PathVariable String stp) {

		System.out.println("stp" +stp);

		String view_step = "";


		if("step2".equals(stp)) {				//결제완료
			view_step = "결제완료";
		}else if("step3".equals(stp)) {				//배송준비
			view_step = "배송준비";  
		}else if("step4".equals(stp)) {		//배송중
			view_step = "배송중";
		}else if("step5".equals(stp)) {		//배송완료
			view_step = "배송완료";
		}else if("step7".equals(stp)) {		//반품대기
			view_step = "반품대기";
		}else if("step8".equals(stp)) {		//반품완료
			view_step = "반품완료";
		}else if("step9".equals(stp)) {		//교환요청
			view_step = "교환요청";
		}else if("step10".equals(stp)) {				//반송대기
			view_step = "반송대기";
		}else if("step11".equals(stp)) {				//반송완료 및 배송준비
			view_step = "반송완료 및 배송준비";
		}else if("step12".equals(stp)) {				//반품배송중
			view_step = "반품배송중";
		}else if("step13".equals(stp)) {				//배송 및 교환완료
			view_step = "배송 및 교환완료";
		}else if("step15".equals(stp)) {				//결제취소(판매자사유)
			view_step = "결체취소(판매자사유)";
		}

		List<OrderDTO> list = sellerservice.viewStepOrder(view_step);
		model.addAttribute("orderlist", list);


		model.addAttribute("sellerpage", "orders.jsp");
		return "sellers/temp";		
	}

	//주문목록 단계변경
	@RequestMapping("/change_step/{stp}/{wantChangeOrderNo}")
	public String changeState(@PathVariable String stp, @PathVariable String wantChangeOrderNo) {

		System.out.println("stp" +stp);

		String change_step = "";
		String[] ordernos = wantChangeOrderNo.split(",");


		System.out.println("change_step" +  change_step);
		System.out.println("ordercodes" + ordernos);
		System.out.println("wantChange..." + ordernos);

		if("step3".equals(stp)) {				//배송준비
			change_step = "배송준비";
		}else if("step4".equals(stp)) {		//배송중
			change_step = "배송중";
		}else if("step5".equals(stp)) {		//배송완료
			change_step = "배송완료";
		}else if("step7".equals(stp)) {		//반품대기
			change_step = "반품대기";
		}else if("step8".equals(stp)) {		//반품완료
			change_step = "반품완료";
		}else if("step9".equals(stp)) {		//교환요청
			change_step = "교환요청";
		}else if("step10".equals(stp)) {				//반송대기
			change_step = "반송대기";
		}else if("step11".equals(stp)) {				//반송완료 및 배송준비
			change_step = "반송완료 및 배송준비";
		}else if("step12".equals(stp)) {				//반품배송중
			change_step = "반품배송중";
		}else if("step13".equals(stp)) {				//배송 및 교환완료
			change_step = "배송 및 교환완료";
		}else if("step15".equals(stp)) {				//결제취소(판매자사유)
			change_step = "결체취소(판매자사유)";
		}

		for(String orderno : ordernos) {	     
			OrderDTO dto = new OrderDTO();
			
			int order_no = Integer.parseInt(orderno);
			dto.setOrder_no(order_no);
			dto.setDelivery_state(change_step);

			System.out.println(dto.getOrder_no());
			System.out.println(dto.getDelivery_state());
			sellerservice.changeStep(dto);
		}
		return "redirect:/seller/orders";
	}


	//운송장번호 입력(업데이트)
	@RequestMapping("/updateTracking/{codes}/{trackings}")
	public String updateTracking(@PathVariable String codes, @PathVariable String trackings) {

		String[] code = codes.split(",");  
		String[] tracking = trackings.split(",");


		for(int i = 0 ; i < code.length  ; i++) {
			OrderDTO dto = new OrderDTO();
			dto.setOrder_no(Integer.parseInt(code[i]));
			dto.setTracking_no(tracking[i]);

			sellerservice.updateTracking(dto);
		}

		return "redirect:/seller/orders";
	}


	/*	@RequestMapping("/updateTracking")
	public String updateTracking(@RequestParam(required=false) List<String> ordercode, 
			@RequestParam(required=false) List<String> tracking_no ) {

		System.out.println(ordercode);
		System.out.println(tracking_no);

		return "redirect:/seller/orders";


	}*/


	//통계 연결
	@RequestMapping("/charts1")
	public String daylist(Model model) {

		//일별
		String order_code = "20200317";
		int orderSum = 0;

		List<OrderDTO> daylist = sellerservice.getDayProfit(order_code);

		for(OrderDTO dto : daylist) {
			System.out.println();
			System.out.println(dto);
			System.out.println();
			orderSum += (dto.getPrice() + dto.getAdd_price() + dto.getShipping_cost() * dto.getQuantity());
		}

		//하루 수익 (가격 + 추가금액 + 
		System.out.println(orderSum);

		//		상품1개	price + add_price + shippingcost ) * cart_quantity
		//		sum += price + add_price + shippingcost ) * cart_quantity
		// 		sum  == 총결제금액

		//		price 
		//월별




		//상품별

		model.addAttribute("sellerpage", "charts.jsp");
		return "sellers/temp";
	}

	// 월별
	@RequestMapping("/charts")
	public String monthlist(Model model) {

		String order_code = "202003";
		int orderSum = 0;

		List<OrderDTO> monthlist = sellerservice.getDayProfit(order_code);

		for(OrderDTO dto : monthlist) {
			System.out.println();
			System.out.println(dto);
			System.out.println();
			orderSum += (dto.getPrice() + dto.getAdd_price() + dto.getShipping_cost() * dto.getQuantity());
		}

		//3월수익
		System.out.println(orderSum);


		model.addAttribute("sellerpage", "charts.jsp");
		return "sellers/temp";
	}


	//정산 신청
	@RequestMapping("/requestaccounting")
	public String requestaccounting(Model model) {



		model.addAttribute("sellerpage", "requestaccounting.jsp");
		return "sellers/temp";
	}

	//정산 리스트
	@RequestMapping("/accounting")
	public String accounting(Model model) {

		model.addAttribute("sellerpage", "accounting.jsp");
		return "sellers/temp";
	}

	//판매자 정보
	@RequestMapping("/sellerinfo")
	public String sellerinfo(Model model, Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		System.out.println("sellerinfo - sellercode : " + seller_code);

		SellerDTO dto = sellerservice.sellerInfo(seller_code);

		System.out.println("sellerinfo - sellerdto : " + dto);

		model.addAttribute("dto", dto);
		model.addAttribute("sellerpage", "seller_info.jsp");
		return "sellers/temp";
	}

	@RequestMapping("/changeInfo")
	public String changeInfo(SellerDTO dto) {
		//  전화번호  - 추가해서 DB에 저장
		String tel = dto.getSeller_tel();
		String tel1 = tel.substring(0,3);
		String tel2 = tel.substring(3, 7);
		String tel3 = tel.substring(7, 11);
		
		String new_tel  = tel1 + "-" + tel2 + "-" + tel3;
		dto.setSeller_tel(new_tel);
		
		sellerservice.changeInfo(dto);
		return "redirect:/seller/sellerinfo";
	}



	//판매자 설정
	@RequestMapping("/sellersetting")
	public String sellersetting(Model model, Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);


		SellerDTO dto = sellerservice.sellerInfo(seller_code);

		model.addAttribute("dto", dto);
		System.out.println(dto.getComm_img1());
		model.addAttribute("sellerpage", "seller_setting.jsp");
		return "sellers/temp";
	}

	//판매자 설정 리절트
	@RequestMapping(value="/settingUpdate", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String settingUpdate(Principal p, HttpServletRequest request,  Model model, SellerDTO dto) {
		//id 가져오는 방법
		String id= getId(model,p);
		System.out.println(id);

		dto.setId(id);
		//
		//multipart 파일을 multi에 담아줌
		//	MultipartFile multi = dto.getAseller_bgcolor();
		MultipartFile multi1 = dto.getAcomm_img1();
		MultipartFile multi2 = dto.getAcomm_img2();
		MultipartFile multi3 = dto.getAcomm_img3();

		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String time1 = frm.format(date);
		String bgcolor = "bgcolor"+time1+".jpg";
		String comm1 = "comm_img1_" + time1+".jpg";
		String comm2 = "comm_img2_" + time1+".jpg";
		String comm3 = "comm_img3_" + time1+".jpg";

		String path = "resources\\comm_img";
		try {

			//저장 경로 구하기
			String uploadpath = request.getSession().getServletContext().getRealPath(path);

			//	String uploadpath = "C:\\finalgit\\sunstar\\src\\main\\webapp\\resources\\comm_img";
			System.out.println("*******\t uploadpath"+uploadpath);

			if(!multi1.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file1 = new File(uploadpath, multi1.getOriginalFilename());
				multi1.transferTo(file1);
				String new_file_url_name = uploadpath+"/"+comm1;
				File nfile1 = new File(new_file_url_name);
				file1.renameTo(nfile1);
				dto.setComm_img1(path+"\\"+ comm1);
			}

			if(!multi2.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file2 = new File(uploadpath, multi2.getOriginalFilename());
				multi2.transferTo(file2);
				String new_file_url_name = uploadpath+"/"+comm2;
				File nfile2 = new File(new_file_url_name);
				file2.renameTo(nfile2);
				dto.setComm_img2(path+"\\"+ comm2);
			}

			if(!multi3.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file3 = new File(uploadpath, multi3.getOriginalFilename());
				multi3.transferTo(file3);
				String new_file_url_name = uploadpath+"/"+comm3;
				File nfile3 = new File(new_file_url_name);
				file3.renameTo(nfile3);
				dto.setComm_img3(path+"\\"+ comm3);
			}


		}catch(IOException e){
			e.getMessage();

		}

		System.out.println("-----------------\n\n"+dto+"\n\n----------------");

		sellerservice.update_seller_info(dto);
		System.out.println("comm_img 1 :   " +dto.getComm_img1());
		System.out.println("comm_img 2 :   " +dto.getComm_img2());
		System.out.println("comm_img 3 :   " +dto.getComm_img3());


		return "redirect:/seller/sellersetting";
	}




	//판매자별 상품리스트
	@RequestMapping("/seller_list") 
	public String seller_list(Model model, Principal principal ) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id); 

		List<ProductDTO> pdto = sellerservice.list();
		SellerDTO sdto = sellerservice.sellerInfo(seller_code);
		List<ProductDTO> productlist = sellerservice.product_list_user(seller_code);

		System.out.println(sdto.getSeller_code());
		System.out.println(sdto.getSeller_color());

		model.addAttribute("productlist",productlist);

		model.addAttribute("pdto", pdto);
		model.addAttribute("sdto", sdto);
		model.addAttribute("contentpage", "sellers/sellers_list.jsp");
		return "home";
	}


	//dataTable
	@RequestMapping("/dataTableTest")
	public String datatable_test(Model model, Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		List<OrderDTO> orderlist = sellerservice.orderlist(seller_code);
		model.addAttribute("olist", orderlist);

		model.addAttribute("sellerpage", "datatableTest.jsp");
		return "sellers/temp";

	}

	@RequestMapping(value="/productUpdate", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String productUpdate(HttpServletRequest request , ProductDTO dto) {

		//multipart 파일을 multi에 담아줌
		MultipartFile multi = dto.getAthumb_img();
		MultipartFile multi1 = dto.getAdetail_img1();		
		MultipartFile multi2 = dto.getAdetail_img2();
		MultipartFile multi3 = dto.getAdetail_img3();

		MultipartFile multi4 = dto.getAdetail_img4();		
		MultipartFile multi5 = dto.getAdetail_img5();
		MultipartFile multi6 = dto.getAdetail_img6();

		System.out.println(multi);
		System.out.println(multi1);
		System.out.println(multi2);
		System.out.println(multi3);
		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String time1 = frm.format(date);
		String thumb = "thumb_"+time1+".jpg";
		String detail1 = "detail1_" + time1+".jpg";
		String detail2 = "detail2_" + time1+".jpg";
		String detail3 = "detail3_" + time1+".jpg";

		String detail4 = "detail4_" + time1+".jpg";
		String detail5 = "detail5_" + time1+".jpg";
		String detail6 = "detail6_" + time1+".jpg";
		String path="resources\\product_img";
		try {
			//저장 경로 구하기
			String uploadpath = request.getSession().getServletContext().getRealPath(path);

			//	String uploadpath = "C:\\finalgit\\sunstar\\src\\main\\webapp\\resources\\product_img";
			System.out.println(uploadpath);

			//파일이 비어있지 않다면!
			if(!multi.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);
				String new_file_url_name = uploadpath+"/"+thumb;
				File file2 = new File(new_file_url_name);
				file.renameTo(file2);
				dto.setThumb_img(path+"\\"+ thumb);
			}

			if(!multi1.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file1 = new File(uploadpath, multi1.getOriginalFilename());
				multi1.transferTo(file1);
				String new_file_url_name = uploadpath+"/"+detail1;
				File nfile1 = new File(new_file_url_name);
				file1.renameTo(nfile1);
				dto.setDetail_img1(path+"\\"+ detail1);
			}

			if(!multi2.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file2 = new File(uploadpath, multi2.getOriginalFilename());
				multi2.transferTo(file2);
				String new_file_url_name = uploadpath+"/"+detail2;
				File nfile2 = new File(new_file_url_name);
				file2.renameTo(nfile2);
				dto.setDetail_img2(path+"\\"+ detail2);
			}

			if(!multi3.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file3 = new File(uploadpath, multi3.getOriginalFilename());
				multi3.transferTo(file3);
				String new_file_url_name = uploadpath+"/"+detail3;
				File nfile3 = new File(new_file_url_name);
				file3.renameTo(nfile3);
				dto.setDetail_img3(path+"\\"+ detail3);
			}


			if(!multi4.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file4= new File(uploadpath, multi4.getOriginalFilename());
				multi4.transferTo(file4);
				String new_file_url_name = uploadpath+"/"+detail4;
				File nfile4 = new File(new_file_url_name);
				file4.renameTo(nfile4);
				dto.setDetail_img4(path+"\\"+ detail4);
			}


			if(!multi5.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file5 = new File(uploadpath, multi5.getOriginalFilename());
				multi5.transferTo(file5);
				String new_file_url_name = uploadpath+"/"+detail5;
				File nfile5 = new File(new_file_url_name);
				file5.renameTo(nfile5);
				dto.setDetail_img5(path+"\\"+ detail5);
			}


			if(!multi6.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file6 = new File(uploadpath, multi6.getOriginalFilename());
				multi6.transferTo(file6);
				String new_file_url_name = uploadpath+"/"+detail6;
				File nfile6 = new File(new_file_url_name);
				file6.renameTo(nfile6);
				dto.setDetail_img6(path+"\\"+ detail6);
			}

			if(dto.isPublic_state()== true) {
				dto.setPublic_state(true);
			}else if(dto.isPublic_state() != true) {
				dto.setPublic_state(false);
			}else if(dto.isReview_state() == true) {
				dto.setReview_state((true));
			}else if(dto.isReview_state() != true) {
				dto.setReview_state((false));
			}

		}catch(IOException e){
			e.getMessage();
		}


		sellerservice.updateProduct(dto);
		System.out.println(">>> \n"+ dto +"\n<<<");
		return "redirect:/seller/productlist";

	}

	@RequestMapping("/product_qna")
	public String product_qna(Model model, Principal principal) {
		//id 가져오는 방법
		String id= getId(model, principal);

		System.out.println(id);

		String seller_code = sellerservice.getSellerCode(id);

		List<QnaDTO> list = sellerservice.getQnaList(seller_code);

		model.addAttribute("list", list);
		model.addAttribute("sellerpage", "product_qna.jsp");
		return "sellers/temp";
	}


	@RequestMapping("/qna_reply")
	public String qna_reply(Model model, QnaDTO dto) {

		dto.setQna_state("답변완료");
		sellerservice.qna_reply(dto);

		return "redirect:/seller/product_qna";
	}

	@RequestMapping("/qna_reply_del")
	public String qna_reply_del(Model model, QnaDTO dto) {

		dto.setQna_state("답변대기");
		dto.setQna_reply(null);
		dto.setReply_date(null);
		sellerservice.qna_reply(dto);
		return "redirect:/seller/product_qna";
	}

	/*	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value="/deadline", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String deadline(MultipartFile deadline_file, String deadline, String seller_name, Model model) {
		MultipartFile multi = deadline_file;
		SimpleDateFormat frm = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String time1 = frm.format(date);
		final String ddline = "ddline"+time1+".jpg";
		 String pathh = "";
		try {
			//저장 경로 구하기
			String uploadpath = "C:\\finalgit\\sunstar\\src\\main\\webapp\\resources\\deadline";
			System.out.println(uploadpath);
			//파일이 비어있지 않다면!
			if(!multi.isEmpty()) {
				//파일 = 새파일(경로, 파일이름);
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);
				String new_file_url_name = uploadpath+"/"+ddline;
				File file2 = new File(new_file_url_name);
				file.renameTo(file2);
				pathh = "resources\\product_img\\" + ddline;
			}
		}catch(IOException e){
			e.getMessage();
		}
		final MimeMessagePreparator pp = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
				helper.setFrom("sbbj_sunstar@naver.com");
				helper.setTo("sbbj_sunstar@naver.com");
				helper.setSubject("이용기한 연장");
				helper.setText("seller_name : " +seller_name
						+ "<br>"
						+ "deadline : " + deadline
						+ "<br>"
						+ "이미지 경로: "+ ddline,  true);
			}
		};
		mailSender.send(pp);
		model.addAttribute("sellerpage", "suc.jsp");
		return "seller/success";
	}
	 */


	@RequestMapping("/search_order")
	public String search_order(Model model) {

		model.addAttribute("sellerpage", "search_order.jsp");
		return "sellers/temp";
	}

	@RequestMapping("/searchOrderView")
	public String  searchOrderView(Model model, Principal principal, @RequestParam String search_order ) {
		

		List<OrderDTO> list = sellerservice.searchOrderView(search_order);
		
		System.out.println("list 출력 : " + list);
		if(list.isEmpty() ) {
			return "redirect:/seller/search_order";
		}
		
		
		OrderDTO dto  = new OrderDTO();
		if(list.get(0).getOrder_code() == null || list.get(0).getOrder_code()=="") {
			return "redirect:/seller/search_order";
		}
		dto.setOrder_code(list.get(0).getOrder_code());
		dto.setOrder_way(list.get(0).getOrder_way());
		dto.setTo_name(list.get(0).getTo_name());
		dto.setShipping_addr1(list.get(0).getShipping_addr1());
		dto.setShipping_addr2(list.get(0).getShipping_addr2());
		dto.setShipping_addr3(list.get(0).getShipping_addr3());
		dto.setShipping_zip(list.get(0).getShipping_zip());
		dto.setDelivery_state(list.get(0).getDelivery_state());
		dto.setTracking_no(list.get(0).getTracking_no());
		dto.setShipping_company(list.get(0).getShipping_company());
		dto.setShipping_cost(list.get(0).getShipping_cost());
		dto.setShipping_company(list.get(0).getShipping_company());

		int allprice = 0;
		for(int i =0; i< list.size();i++) {
			allprice+= list.get(i).getPrice();
		}
		dto.setPrice(allprice+list.get(0).getShipping_cost());


		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("sellerpage", "search_order.jsp");
		return "sellers/temp";
		
		
		//id 가져오는 방법
	/*	String id= getId(model, principal);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		
		List<OrderDTO> odto = sellerservice.orderlist(seller_code);
		
		
		for(int i = 0 ; i<odto.size();i++) {
			if(odto.contains(search_order)) {
				List<OrderDTO> list = sellerservice.searchOrderView(search_order);
				OrderDTO dto  = new OrderDTO();
				dto.setOrder_code(list.get(0).getOrder_code());
				dto.setOrder_way(list.get(0).getOrder_way());
				dto.setTo_name(list.get(0).getTo_name());
				dto.setShipping_addr1(list.get(0).getShipping_addr1());
				dto.setShipping_addr2(list.get(0).getShipping_addr2());
				dto.setShipping_addr3(list.get(0).getShipping_addr3());
				dto.setShipping_zip(list.get(0).getShipping_zip());
				dto.setDelivery_state(list.get(0).getDelivery_state());
				dto.setTracking_no(list.get(0).getTracking_no());
				dto.setShipping_company(list.get(0).getShipping_company());
				dto.setShipping_cost(list.get(0).getShipping_cost());
				dto.setShipping_company(list.get(0).getShipping_company());
		
				int allprice = 0;
				for(int j =0; j< list.size();j++) {
					allprice+= list.get(i).getPrice();
				}
				dto.setPrice(allprice+list.get(0).getShipping_cost());
				model.addAttribute("dto", dto);
				model.addAttribute("list", list);
				model.addAttribute("sellerpage", "search_order.jsp");
				return "sellers/temp";
			}
		}		
		return "redirect:/seller/search_order";*/

	}
	
	@RequestMapping("/product_review")
	public String product_review(Model m, Principal p ) {
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		//판매자 코드가 일치하는 리뷰 테이블에서 값을 받아옴
		List<ReviewDTO> list = sellerservice.getReview(seller_code);

		List<ReviewImgDTO> imglist = new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			int review_no = list.get(i).getReview_no();

			imglist =sellerservice.getReviewImgCount(review_no) ;

			for(int j = 0; j < imglist.size(); j++) {
				int img_no 			= imglist.get(j).getImg_no();
				int img_re_no 		= imglist.get(j).getReview_no();
				String review_img 	= imglist.get(j).getReview_img();
				System.out.println(img_no+"\t"+ img_re_no +"\t"+ review_img);
				list.get(i).setImgdto(imglist);
			}
		}
		m.addAttribute("list", list);
		m.addAttribute("sellerpage", "product_review.jsp");
		return "sellers/temp";
	}

	@RequestMapping("/review_del")
	public String review_del( @RequestParam int review_no) {

		sellerservice.review_del(review_no);


		return "redirect:/seller/product_review";		
	}

	//판매자별 월별 총 수익
	@RequestMapping("/charts/month")
	public String month_chart(Model m, Principal p ) {
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		Date date = new Date();
		
		System.out.println("date" + date);
		
		
		//월별 데이터//
		String  month = "'2020-01', '2020-02', '2020-03', '2020-04', '2020-05', '2020-06', '2020-07', '2020-08', '2020-09', '2020-10', '2020-11', '2020-12'";

		ChartDTO dto = new ChartDTO();
		dto.setSeller_code(seller_code);
		int[] month_data = new int[12];

		String mdata = "";
		String mdataa = "";

		for(int i = 0 ; i < 12 ; i++){
			System.out.println(month_data[i]);
			dto.setMonth(dto.getYyyymm()[i]);

			System.out.println("yyyymm의 값 :: " +dto.getYyyymm()[i]);
			if(dto.getMm()[i] == 1) {
				mdata += sellerservice.month_chart(dto);
				mdataa +=  (int)(sellerservice.month_chart(dto) + sellerservice.month_chart_plus(dto));
				System.out.println("mdata : " + mdata);
				System.out.println("mdata2 : " + mdataa);
			}else {
				mdata += "," + sellerservice.month_chart(dto);
				mdataa +=  "," + (int)(sellerservice.month_chart(dto) + sellerservice.month_chart_plus(dto));
				
				
				System.out.println( "else1: " + mdata);
				System.out.println( "else2: " + mdataa);
			}
		}

		System.out.println("mdata--------" + mdata);
		System.out.println("mdata2--------" + mdataa);
		
		m.addAttribute("month", month);
		m.addAttribute("mdata",mdata);
		m.addAttribute("mdataa",mdataa);
		
		//일별 데이터 //
		String  days = "'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'";
		ChartDTO daydto = new ChartDTO();
		daydto.setSeller_code(seller_code);
		daydto.setMonth(202003);
		
		
		String daydata = "";
		String daydataplus = "";
		
		for(int i = 0 ; i < 31 ; i++){
			
			daydto.setYyyymmdd(daydto.getMonth()+daydto.getDd()[i]);
			System.out.println(dto.getYyyymmdd());
			if(daydto.getDd()[i] == "01") {
				daydata += sellerservice.day_chart(daydto);
				daydataplus += (int)(sellerservice.day_chart(daydto)+sellerservice.day_chart_plus(daydto));
				System.out.println(daydata);
				System.out.println(daydataplus);
			}else {
				daydata += "," + sellerservice.day_chart(daydto);
				daydataplus += ","+ (int)(sellerservice.day_chart(daydto)+sellerservice.day_chart_plus(daydto));
				System.out.println(daydata);
				System.out.println(daydataplus);
			}
		}
		
		System.out.println(daydata);

		System.out.println(daydataplus);
		m.addAttribute("days", days);
		m.addAttribute("daydata", daydata);
		m.addAttribute("daydataplus", daydataplus);
		
		
		////
		
		m.addAttribute("sellerpage", "charts/month_chart.jsp");
		return "sellers/temp";
	}
	
	@RequestMapping("/switchCustomer")
	public String switchCustomer(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		List<OrderDTO> orderlist = sellerservice.orderlist(seller_code);
		
		String compl = "정상처리 주문코드 -> ";
		String order_codes = "";
		
		
		for(int i = 0; i< orderlist.size(); i++) {
			orderlist.get(i).getDelivery_state();
			System.out.println(orderlist.get(i).getDelivery_state());
			//delivery_state 가 '완료가 아니라면 반려

			if( orderlist.get(i).getDelivery_state().equals("배송완료") ||
					orderlist.get(i).getDelivery_state().equals("반송완료") ||
					orderlist.get(i).getDelivery_state().equals("배송완료 및 교환완료") ||
					orderlist.get(i).getDelivery_state().equals("결체취소 완료")) {
				compl += orderlist.get(i).getOrder_code() + ", ";	
			}else {
				order_codes += 	orderlist.get(i).getOrder_code() + ", ";		
			}
		}
		m.addAttribute("compl", compl);
		System.out.println("order_codes = " + order_codes);
		m.addAttribute("order_codes", order_codes);
		
		m.addAttribute("sellerpage", "switchCustomer.jsp");
		return "sellers/temp";
		
	}
	
	@RequestMapping("/real_switch_customer")
	public String real_switch_customer(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		//상품 삭제 	
		sellerservice.delete_products(seller_code);
		//권한 삭제
		sellerservice.delete_auth(id);
		return "redirect:http://${pageContext.request.contextPath}/";
	}
	
}





