package com.sunstar.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerservice;


	@RequestMapping("/seller")
	public String seller(Model model) {

		model.addAttribute("sellerpage", "temp_main.jsp");
		return "sellers/temp";
	}

	//상품 목록 보기
	@RequestMapping("/productlist")
	public String product(Model model) {

		List<ProductDTO> plist = sellerservice.list();		

		model.addAttribute("plist", plist);

		//
		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);
		//

		model.addAttribute("sellerpage", "productlist.jsp");
		return "sellers/temp";
	}

	//상품 추가 하기
	@RequestMapping("/addproduct")
	public String addproduct(Model model) {

		//페이지에 카테고리 표시
		List<CategoryDTO> clist = sellerservice.getCategory();
		List<CategoryDTO> dlist = new ArrayList<>();
		for(CategoryDTO dto : clist) {
			dto.setLv123(dto.getLv1()+" - "+dto.getLv2()+" - "+dto.getLv3()); 
			dlist.add(dto);
		}
		model.addAttribute("dlist", dlist);

		model.addAttribute("sellerpage", "addsproduct.jsp");
		return "sellers/temp";
	}

	//상품 추가 결과
	@RequestMapping("/addproductresult")
	public String addproductresult(ProductDTO dto) {
		sellerservice.addProduct(dto);
		return "redirect:/productlist";
	}

	//상품 삭제
	@RequestMapping("/deleteproduct/{pcode}")
	public String deleteproduct(@PathVariable int pcode ) {

		sellerservice.deleteProduct(pcode);
		return "redirect:/productlist";
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

		return "redirect:/productlist";
	}


	//주문 목록
	@RequestMapping("/orders")
	public String orders(Model model) {

		List<OrderDTO> orderlist = sellerservice.orderlist();
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("sellerpage", "orders.jsp");
		return "sellers/temp";

	}

	//출력
	@RequestMapping(value="/orderexcel/{state}")
	public void orderexcel(HttpServletResponse response, @PathVariable String state) throws Exception{
		List<OrderDTO> orderlist = new ArrayList<>();
		
		String[] data = state.split(",");

		System.out.println("state"+state);
		System.out.println("data"+data.toString());
		
		
		//배송대기 출력
		if("shipping_list".equals(state)) {
			orderlist =  sellerservice.shippinglist();
			
		//전체출력
		}else if("all".equals(state)){
			orderlist = sellerservice.orderlist();
			
		//선택한 값 출력
		}else {
			for(String order_code : data) {	     
				System.out.print("order_code : ");
				System.out.println(order_code);
				orderlist.add(sellerservice.theOrderlist(order_code));
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
			cell.setCellValue(dto.getColor()+"/"+dto.getSize()+"/");

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

	//통계 연결
	@RequestMapping("/charts")
	public String charts(Model model) {

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
	public String sellerinfo(Model model) {

		model.addAttribute("sellerpage", "seller_info.jsp");
		return "sellers/temp";
	}

	//판매자 설정
	@RequestMapping("/sellersetting")
	public String sellersetting(Model model) {

		model.addAttribute("sellerpage", "seller_setting.jsp");
		return "sellers/temp";
	}

	//판매자별 상품리스트
	@RequestMapping("/seller_list")
	public String seller_list(Model model) {
		model.addAttribute("contentpage", "sellers/sellers_list.jsp");
		return "home";
	}


}
