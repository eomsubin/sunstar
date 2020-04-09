package com.sunstar.controller;


import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sunstar.dto.AccountsDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ChartDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.QnaDTO;
import com.sunstar.dto.ReviewDTO;
import com.sunstar.dto.ReviewImgDTO;
import com.sunstar.dto.SellerDTO;
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

	public String getId( Model m, Principal p) {
		String id = "";
		if(p!=null) {
			id= p.getName();

			System.out.println(id);
		}
		return id;
	}


	@RequestMapping("/seller")
	public String seller(Model m,  Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		
		//상단 단계별 건수 표시
		int paid = sellerservice.getPaid(seller_code);
		int ready = sellerservice.getReadyCount(seller_code);
		int exchange =  sellerservice.getExchangeCount(seller_code);
		int bringBack = sellerservice.getBringBack(seller_code);
		int waitAnswer = sellerservice.getWaitAnswer(seller_code);

		System.out.println(ready + "/" + exchange + "/" + bringBack + "/" + waitAnswer);


		//파이 그래프
		List<ChartDTO> top5category =  sellerservice.get_top5(seller_code);
		String category_name = "";
		String top5Count = "";
		
		for(int i = 0; i < top5category.size() ; i++) {
			if( i == 0 ) {
				category_name += ("'"+ top5category.get(i).getLv1() +"-"+ top5category.get(i).getLv2() +"-"+ top5category.get(i).getLv3() +"'");
				top5Count += top5category.get(i).getTop5count();
				
			}else {
				category_name += "," + ("'"+ top5category.get(i).getLv1() +"-"+ top5category.get(i).getLv2() +"-"+ top5category.get(i).getLv3() +"'");
				top5Count += "," + top5category.get(i).getTop5count();
			}
		}
		
		System.out.println(category_name);
		System.out.println(top5Count);
		
		//판매량 top5
		List<ChartDTO> top5products = sellerservice.get_top5items(seller_code);
		String product_name ="";
		String top5itemsCount ="";
		
		for(int i = 0; i < top5products.size() ; i++) {
			if( i == 0 ) {
				product_name += ("'"+ top5products.get(i).getProduct_name() + "'");
				top5itemsCount += top5products.get(i).getAccumulation();
				
			}else {
				product_name += "," + ("'"+top5products.get(i).getProduct_name() +"'");
				top5itemsCount += "," + top5products.get(i).getAccumulation();
			}
		}
		
		System.out.println(category_name);
		System.out.println(top5Count);

		//최근 10일간 주문건수
		Calendar c1 = new GregorianCalendar();		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 

		
		ChartDTO getOrderCount = new ChartDTO();
		List<ChartDTO> getOrderCounts = new ArrayList<>();
		getOrderCount.setSeller_code(seller_code);
		
		
		String ten_days[] = new String[10];
		String ten_day_data[] = new String[10];
		
		
		c1.add(Calendar.DATE, -9); 
		format.format(c1.getTime());
		
		ten_days[0] = format.format(c1.getTime());
		ten_day_data[0] = "0";
		
		for(int i = 1; i < 10; i++) {
			c1.add(Calendar.DATE, +1); 
			String day= format.format(c1.getTime());
			ten_days[i]=day;
			
			 getOrderCount.setYyyymmdd(day);
			 ten_day_data[i] = Integer.toString(sellerservice.getOrderCount(getOrderCount));
		}
		
		String day10 =ten_days[0];
		String day10data = ten_day_data[0];


		for(int a = 1; a < 10; a++) {
			day10 += "," + ten_days[a];
			day10data += "," + ten_day_data[a];
		}
		
		
		System.out.println("첫번째 차트");
		
		System.out.println(day10);
		System.out.println(day10data);
		
		System.out.println("------");
		
		
		//
		m.addAttribute("seller_code", seller_code);
		
		//
		m.addAttribute("paid", paid);
		m.addAttribute("ready", ready);
		m.addAttribute("exchange", exchange);
		m.addAttribute("bringback", bringBack);
		m.addAttribute("waitAnswer",waitAnswer);
		//
		m.addAttribute("category_name", category_name);
		m.addAttribute("top5Count", top5Count);
		//
		m.addAttribute("product_name", product_name);
		m.addAttribute("top5itemsCount", top5itemsCount);
		//
		
		m.addAttribute("day10", day10);
		m.addAttribute("day10data", day10data);
	
		
		
		m.addAttribute("sellerpage", "temp_main.jsp");
		return "sellers/temp";
	}

	//상품 목록 보기
	@RequestMapping("/productlist")
	public String product(Model m, Principal p,
			@RequestParam(required=false, defaultValue="1")int currPage,
			@RequestParam(required=false, defaultValue="10")int psize,
			@RequestParam(required=false, defaultValue="")String txt
			) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);

		String seller_code = sellerservice.getSellerCode(id);


		//페이징 및 검색
		/*		Pattern p = Pattern.compile("(^[0-9]*$)");

		if(txt != null || !txt.equals("")) {
			Matcher m = p.matcher(txt);
			if(!m.find()) {
				txt="";
				m.addAttribute("txt", txt);
			}else {
				m.addAttribute("txt",txt);
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
		m.addAttribute("list", list);

		m.addAttribute("page", page);


		//페이징 및  끝

		m.addAttribute("sellerpage", "productlist.jsp");
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
	public void productExcel(Model m, Principal p, HttpServletResponse response) throws Exception{
		List<ProductDTO> productList = new ArrayList<>();
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);

		String seller_code = sellerservice.getSellerCode(id);

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
			cell.setCellValue(dto.getBasic_shipping_cost());

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
	public String addproduct(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		m.addAttribute("seller_code", seller_code);

		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		m.addAttribute("dlist", dlist);

		//기본배송비 불러오기
		SellerDTO dto = sellerservice.sellerInfo(seller_code);
		String basic_shipping_cost = dto.getBasic_shipping_cost();


		m.addAttribute("shipping_cost", basic_shipping_cost);



		m.addAttribute("sellerpage", "addsproduct.jsp");
		return "sellers/temp";
	}

	//상품 추가 결과
	@RequestMapping(value = "/addproductresult", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String addproductresult(HttpServletRequest request, ProductDTO dto, HttpServletRequest req, Model m) {

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
	@RequestMapping("/deleteproduct/{pcodes}")
	public String deleteproduct(@PathVariable String pcodes ) {
		
		String[] data = pcodes.split(",");
		
		
		for(int i = 0; i < data.length; i++) {
			sellerservice.deleteProduct(Integer.parseInt(data[i]));
			System.out.println("삭제할거 출력~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + data[i]);

		}
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
	public String orders(Model m, Principal p) {

		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		List<OrderDTO> orderlist = sellerservice.orderlist(seller_code);
		m.addAttribute("orderlist", orderlist);
		m.addAttribute("sellerpage", "orders.jsp");
		return "sellers/temp";

	}

	//주문목록 출력
	@RequestMapping(value="/orderexcel/{state}")
	public void orderexcel(HttpServletResponse response, @PathVariable String state, Model m, Principal p) throws Exception{

		//id 가져오는 방법
		String id= getId(m, p);
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
	public String viewStep(Model m, Principal p, @PathVariable String stp) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		
		
		System.out.println("stp" +stp);

		String view_step = "";
		if("step1".equals(stp)) {				//결제완료
			view_step = "결제대기중";
		}else if("step2".equals(stp)) {				//결제완료
			view_step = "결제완료";
		}else if("step3".equals(stp)) {				//배송준비
			view_step = "배송준비";  
		}else if("step4".equals(stp)) {		//배송중
			view_step = "배송중";
		}else if("step5".equals(stp)) {		//배송완료
			view_step = "배송완료";
		}else if("step6".equals(stp)) {		//반품요청
			view_step = "반품요청";
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
		}else if("step14".equals(stp)) {				//결제취소(판매자사유)
			view_step = "결제취소 요청(구매자 사유)";
		}else if("step15".equals(stp)) {				//결제취소(판매자사유)
			view_step = "결체취소(판매자사유)";
		}else if("step16".equals(stp)) {				//결제취소(판매자사유)
			view_step = "결체취소 완료";
		}

		OrderDTO dto = new OrderDTO();
		dto.setSeller_code(seller_code);
		dto.setDelivery_state(view_step);
		
		List<OrderDTO> list = sellerservice.viewStepOrder(dto);
		m.addAttribute("orderlist", list);


		m.addAttribute("sellerpage", "orders.jsp");
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

		
		

		if("step1".equals(stp)) {				//결제완료
			change_step = "결제대기중";
		}else if("step2".equals(stp)) {				//결제완료
			change_step = "결제완료";
		}else if("step3".equals(stp)) {				//배송준비
			change_step = "배송준비";  
		}else if("step4".equals(stp)) {		//배송중
			change_step = "배송중";
		}else if("step5".equals(stp)) {		//배송완료
			change_step = "배송완료";
		}else if("step6".equals(stp)) {		//반품요청
			change_step = "반품요청";
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
		}else if("step14".equals(stp)) {				//결제취소(판매자사유)
			change_step = "결제취소 요청(구매자사유)";
		}else if("step15".equals(stp)) {				//결제취소(판매자사유)
			change_step = "결체취소(판매자사유)";
		}else if("step16".equals(stp)) {				//결제취소(판매자사유)
			change_step = "결체취소 완료";
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



	//정산 신청
	@RequestMapping("/requestaccounting")
	public String requestaccounting(Model m, Principal p ) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		
		
		
		SellerDTO dto = sellerservice.sellerInfo(seller_code);
		//1일~ 10일 사이에 정산 신청.
		SimpleDateFormat form_dd = new SimpleDateFormat("dd"); 
		Calendar cal = Calendar.getInstance();
		String dd = Integer.toString( cal.get(Calendar.DATE));
		System.out.println("dd - " + dd);
		
		//지난달 정보 구하기
		SimpleDateFormat form_yyyymm = new SimpleDateFormat("yyyyMM"); 
		cal.add(cal.MONTH, -1);
		String yyyymm = form_yyyymm.format(cal.getTime());
		String yyyy = yyyymm.substring(0, 4);
		String mm = yyyymm.substring(4, 6);
		System.out.println("yyyymm - " + yyyymm );
		
		
				
			//
		
		//dto값에 셀러코드랑 연도월 넣기
		ChartDTO setdto = new ChartDTO();
		setdto.setSeller_code(seller_code);
		setdto.setMonth(Integer.parseInt(yyyymm));
		
		System.out.println("setdto" + setdto);
		//지난달 총금액 구하기
		int total =  sellerservice.month_chart(setdto);
		int shipping =  sellerservice.month_chart_plus(setdto);
		int total_profit = total + shipping;
		
		int commission = (int)(total_profit * 0.1);
		int balance_accounts = (int)(total_profit * 0.9);

		System.out.println(total);
		System.out.println(shipping);
		System.out.println(total_profit);
		System.out.println(commission);
		System.out.println(balance_accounts);
		
		//날짜
		
		m.addAttribute("seller_code", seller_code);	

		m.addAttribute("dto", dto);			
		
		
		m.addAttribute("yyyy", yyyy);		
		m.addAttribute("mm", mm);		
		m.addAttribute("dd", dd);		

		m.addAttribute("total_profit", total_profit);
		m.addAttribute("commission", commission);
		m.addAttribute("balance_accounts", balance_accounts);
		m.addAttribute("sellerpage", "requestaccounting.jsp");
		return "sellers/temp";
	}
	
	//정산값 입력
	@RequestMapping("/insertAccount")
	public String insertAccount(Model m, Principal p, AccountsDTO dto ) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		
		List<AccountsDTO> alist= sellerservice.getAccountList(seller_code);
		List<String> ymlist = new ArrayList<>();
		
		for(int i =0 ; i < alist.size(); i++) {
			ymlist.add(alist.get(i).getYyyymm());
			
		}
		
		
		if( ymlist.contains(dto.getYyyymm()) ) {
			return 	"redirect:/seller/accounting";
		}else {
			sellerservice.insertAccount(dto);
		}
			
		return "redirect:/seller/accounting";
	}

	//정산 리스트
	@RequestMapping("/accounting")
	public String accounting(Model m, Principal p ) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		
		
		List<AccountsDTO> alist= sellerservice.getAccountList(seller_code);
		
		m.addAttribute("alist", alist);
		m.addAttribute("sellerpage", "accounting.jsp");
		return "sellers/temp";
	}

	//판매자 정보
	@RequestMapping("/sellerinfo")
	public String sellerinfo(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		System.out.println("sellerinfo - sellercode : " + seller_code);

		SellerDTO dto = sellerservice.sellerInfo(seller_code);

		System.out.println("sellerinfo - sellerdto : " + dto);

		m.addAttribute("dto", dto);
		m.addAttribute("sellerpage", "seller_info.jsp");
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
	public String sellersetting(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);


		SellerDTO dto = sellerservice.sellerInfo(seller_code);

		m.addAttribute("dto", dto);
		System.out.println(dto.getComm_img1());
		m.addAttribute("sellerpage", "seller_setting.jsp");
		return "sellers/temp";
	}

	//판매자 설정 리절트
	@RequestMapping(value="/settingUpdate", method = {RequestMethod.GET, RequestMethod.POST},
			headers = ("content-type=multipart/*"))
	public String settingUpdate(Principal p, HttpServletRequest request,  Model m, SellerDTO dto) {
		//id 가져오는 방법
		String id= getId(m,p);
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




	


	//dataTable
	@RequestMapping("/dataTableTest")
	public String datatable_test(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);
		List<OrderDTO> orderlist = sellerservice.orderlist(seller_code);
		m.addAttribute("olist", orderlist);

		m.addAttribute("sellerpage", "datatableTest.jsp");
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
	public String product_qna(Model m, Principal p) {
		//id 가져오는 방법
		String id= getId(m, p);

		System.out.println(id);

		String seller_code = sellerservice.getSellerCode(id);

		List<QnaDTO> list = sellerservice.getQnaList(seller_code);

		m.addAttribute("list", list);
		m.addAttribute("sellerpage", "product_qna.jsp");
		return "sellers/temp";
	}


	@RequestMapping("/qna_reply")
	public String qna_reply(Model m, QnaDTO dto) {

		dto.setQna_state("답변완료");
		sellerservice.qna_reply(dto);

		return "redirect:/seller/product_qna";
	}

	@RequestMapping("/qna_reply_del")
	public String qna_reply_del(Model m, QnaDTO dto) {

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
	public String deadline(MultipartFile deadline_file, String deadline, String seller_name, Model m) {
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
		m.addAttribute("sellerpage", "suc.jsp");
		return "seller/success";
	}
	 */


	@RequestMapping("/search_order")
	public String search_order(Model m) {

		m.addAttribute("sellerpage", "search_order.jsp");
		return "sellers/temp";
	}

	@RequestMapping("/searchOrderView")
	public String  searchOrderView(Model m, Principal p, @RequestParam String search_order ) {
		//id 가져오는 방법
		String id= getId(m, p);
		System.out.println(id);
		String seller_code = sellerservice.getSellerCode(id);

		OrderDTO user = new OrderDTO();
		user.setSeller_code(seller_code);
		user.setOrder_code(search_order);
		List<OrderDTO> list = sellerservice.searchOrderView(user);
		
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
/*		dto.setDelivery_state(list.get(0).getDelivery_state());
		dto.setTracking_no(list.get(0).getTracking_no());
		dto.setShipping_company(list.get(0).getShipping_company());*/
		dto.setMessage(list.get(0).getMessage());
		dto.setRefund_bank(list.get(0).getRefund_bank());
		dto.setRefund_account(list.get(0).getRefund_account());
		dto.setRefund_msg(list.get(0).getRefund_msg());
		
		
		int allprice = 0;
		for(int i =0; i< list.size();i++) {
			allprice+= list.get(i).getPrice();
		}
		dto.setPrice(allprice);


		m.addAttribute("dto", dto);
		m.addAttribute("list", list);
		m.addAttribute("sellerpage", "search_order.jsp");
		return "sellers/temp";
	}
	
	
	@RequestMapping("/search_order_update")
	public String search_order_update(OrderDTO dto) {
		
		System.out.println(dto);
		
			
		sellerservice.search_order_update(dto);
		return  "redirect:/seller/search_order";

		
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
	
	
	@RequestMapping("/reviews_del/{review_nos}")
	public String reviews_del(@PathVariable String review_nos) {
		
		String[] review_no_cut = review_nos.split(",");
		
		for(int i = 0; i < review_no_cut.length; i++) {
			int review_no = Integer.parseInt(review_no_cut[i]);
			sellerservice.review_del(review_no);
			System.out.println("삭제한  reveiw_no : " + review_no);
		}
		return "redirect:/seller/product_review";
	}

	//판매자별 월별 총 수익
	@RequestMapping("/charts")
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
			dto.setMonth(dto.getYyyymms()[i]);

			System.out.println("yyyymm의 값 :: " +dto.getYyyymms()[i]);
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
		
		
		

		//파이 그래프
		List<ChartDTO> top5category =  sellerservice.get_top5(seller_code);
		String category_name = "";
		String top5Count = "";
		
		for(int i = 0; i < top5category.size() ; i++) {
			if( i == 0 ) {
				category_name += ("'"+ top5category.get(i).getLv1() +"-"+ top5category.get(i).getLv2() +"-"+ top5category.get(i).getLv3() +"'");
				top5Count += top5category.get(i).getTop5count();
				
			}else {
				category_name += "," + ("'"+ top5category.get(i).getLv1() +"-"+ top5category.get(i).getLv2() +"-"+ top5category.get(i).getLv3() +"'");
				top5Count += "," + top5category.get(i).getTop5count();
			}
		}
		
		System.out.println(category_name);
		System.out.println(top5Count);
		
		//판매량 top5
		List<ChartDTO> top5products = sellerservice.get_top5items(seller_code);
		String product_name ="";
		String top5itemsCount ="";
		
		for(int i = 0; i < top5products.size() ; i++) {
			if( i == 0 ) {
				product_name += ("'"+ top5products.get(i).getProduct_name() + "'");
				top5itemsCount += top5products.get(i).getAccumulation();
				
			}else {
				product_name += "," + ("'"+top5products.get(i).getProduct_name() +"'");
				top5itemsCount += "," + top5products.get(i).getAccumulation();
			}
		}
		
		System.out.println(category_name);
		System.out.println(top5Count);

		//최근 10일간 주문건수
		Calendar c1 = new GregorianCalendar();		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 

		
		ChartDTO getOrderCount = new ChartDTO();
		List<ChartDTO> getOrderCounts = new ArrayList<>();
		getOrderCount.setSeller_code(seller_code);
		
		
		String ten_days[] = new String[10];
		String ten_day_data[] = new String[10];
		
		
		c1.add(Calendar.DATE, -9); 
		format.format(c1.getTime());
		
		ten_days[0] = format.format(c1.getTime());
		ten_day_data[0] = "0";
		
		for(int i = 1; i < 10; i++) {
			c1.add(Calendar.DATE, +1); 
			String day= format.format(c1.getTime());
			ten_days[i]=day;
			
			 getOrderCount.setYyyymmdd(day);
			 ten_day_data[i] = Integer.toString(sellerservice.getOrderCount(getOrderCount));
		}
		
		String day10 =ten_days[0];
		String day10data = ten_day_data[0];


		for(int a = 1; a < 10; a++) {
			day10 += "," + ten_days[a];
			day10data += "," + ten_day_data[a];
		}
		
		
		System.out.println("첫번째 차트");
		
		System.out.println(day10);
		System.out.println(day10data);
		
		System.out.println("------");
		
		
		//
		m.addAttribute("seller_code", seller_code);
		
		//
		//
		m.addAttribute("category_name", category_name);
		m.addAttribute("top5Count", top5Count);
		//
		m.addAttribute("product_name", product_name);
		m.addAttribute("top5itemsCount", top5itemsCount);
		//
		
		m.addAttribute("day10", day10);
		m.addAttribute("day10data", day10data);
		
		
		System.out.println(daydata);

		System.out.println(daydataplus);
		m.addAttribute("days", days);
		m.addAttribute("daydata", daydata);
		m.addAttribute("daydataplus", daydataplus);
		
		
		////
		
		m.addAttribute("sellerpage", "charts.jsp");
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





