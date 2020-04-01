 
package com.sunstar.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.MakePage;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;
import com.sunstar.dto.ShipDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.MyPageService;
import com.sunstar.service.PaymentService;

import retrofit2.http.Path;

@Controller
public class MyPageController {
	@Autowired
	private MainService mainservice;	
	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private MyPageService mpservice;
	
	
	@RequestMapping(value="/mypage/info/{upw}")
	public String updatePW(@PathVariable String upw,Principal principal) {
			if(principal!=null) {
			
				CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
				String id = userdetail.getUsername();
		    
				CustomerDTO info = mpservice.getUserInfo(id);
				info.setUpdatepw(upw);
				
				mpservice.updatePw(info);
		
			}else {
				
				return "redirect:/";
			}
			
		
		return "/userlogout";
	}
	
	@RequestMapping("/mypage/info")
	public String mypage(Model model,Principal principal) {
			
		mainservice.header(model);
		if(principal!=null) {
			
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
		    
			CustomerDTO info = mpservice.getUserInfo(id);
			info.setTel(info.getTel().replaceAll("-", ""));
			
			
			
			
			model.addAttribute("info",info);
			model.addAttribute("contentpage","Mypage/mypage.jsp");
			
		}else {
			return "redirect:/";
		}
			
		return "home";
	}
	
	@RequestMapping("/mypage/order")
	public String orderList(Model model, Principal principal, @RequestParam(required=false, defaultValue="1") int currPage,@RequestParam(required=false,defaultValue="10") int pageSize ) {
		mainservice.header(model);
		
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			
			String id = userdetail.getUsername();
			
			CustomerDTO user = mpservice.getUserInfo(id);
			
			id = user.getId();
			
			
			int totalCount = mpservice.getTotalCount(id);
			System.out.println(totalCount);
			
			MakePage makepage = new MakePage();
			makepage.setSizePerPage(10); 
			
			if(pageSize == 0 ) {
				makepage.setSizePerPage(10); 
			}else {
				makepage.setSizePerPage(pageSize); 
			}
			
			
			
			
			
			int blockSize = 3;
			
			MakePage page = new MakePage(currPage, totalCount, makepage.getSizePerPage(), blockSize);
			
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
			
		
			
			page.setId(id);
			System.out.println(page.getStartRow());
			
			List<OrderDTO> buylist = paymentservice.buylist(page);
			
			model.addAttribute("buylist",buylist);
			model.addAttribute("page",page);
			model.addAttribute("contentpage","Mypage/buyer_orderlist.jsp");
			
			
		}else {
			return "redirect:/";
		}
		
		
		return "home";
	}
	
	@RequestMapping("/info/update")
	public String infoUpdate(CustomerDTO info) {
		
		
		mpservice.infoUpdate(info);
		
		
		
		return "redirect:/mypage/info";
	}
	

	@RequestMapping("/mypage/shipaddr")
	public String shipaddr(Model model,Principal principal) {
		mainservice.header(model);
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id = userdetail.getUsername();
			
			CustomerDTO info = mpservice.getUserInfo(id);
			
			id= info.getId();
			List<ShipDTO> slist = mpservice.getShipAddr(id);
			
			model.addAttribute("slist",slist);
			model.addAttribute("info",info);
			model.addAttribute("contentpage","Mypage/shipaddr.jsp");
		
		
		
		}else {
			
			return "redirect:/";
		}
		return "home";
	}
	@ResponseBody
	@RequestMapping(value="/mypage/addshipaddr", method=RequestMethod.POST )
	public void addshipaddr(@RequestBody ShipDTO adddata) {
			
		mpservice.addshipaddr(adddata);
	}
	
	@RequestMapping("/updateShip/{shipping_name}")
	public String updateShip(@PathVariable String shipping_name, Principal principal) {
		
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		
		CustomerDTO info = mpservice.getUserInfo(id);
		id=info.getId();
		ShipDTO sdto = new ShipDTO();
		sdto.setShipping_name(shipping_name);
		sdto.setId(id);
		mpservice.updateShip(sdto);
		
		
	
		return "redirect:/mypage/shipaddr";
	}
		
	@RequestMapping("/deleteship/{shipping_name}")
	public String deleteShip(@PathVariable String shipping_name,Principal principal) {
		
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		
		CustomerDTO info = mpservice.getUserInfo(id);
		ShipDTO sdto = new ShipDTO();
		sdto.setShipping_name(shipping_name);
		sdto.setId(id);
		mpservice.deleteShip(sdto);
		
		return "redirect:/mypage/shipaddr";
		
	}
	
	@RequestMapping("/mypage/orderdetail/{order_code}")
	public String orderDetail(Model model,@PathVariable String order_code) {
		mainservice.header(model);
		
		
		List<OrderDTO> orderdetail = mpservice.orderDetail(order_code); 
		
		OrderDTO orderdto = new OrderDTO();
		// 출력화면 하나만 필요한것
		orderdto.setOrder_code(orderdetail.get(0).getOrder_code());
		orderdto.setOrder_way(orderdetail.get(0).getOrder_way());
		orderdto.setShipping_addr1(orderdetail.get(0).getShipping_addr1());
		orderdto.setShipping_addr2(orderdetail.get(0).getShipping_addr2());
		orderdto.setShipping_addr3(orderdetail.get(0).getShipping_addr3());
		
		
		List<OrderDTO> price = mpservice.getPrice(order_code);  
		
		model.addAttribute("price",price);
		model.addAttribute("one",orderdto);
		// 반복 해야될 자료
		model.addAttribute("orderdetail",orderdetail);
		model.addAttribute("contentpage","Mypage/orderdetail.jsp");
		
		return "home";
	}
	
	@RequestMapping("/mypage/seller_register")
	public String seller_register(Model model,Principal principal, @RequestParam(required=false) String m) {
		if(m == null || "".equals(m))
		{
			m="0";
		}
		mainservice.header(model);
		CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
		String id = userdetail.getUsername();
		CustomerDTO info = mpservice.getUserInfo(id);
		model.addAttribute("dto", info);
		model.addAttribute("contentpage","Mypage/seller_register.jsp");
		model.addAttribute("m", m);
		
		return "home";
	}
	
	

	
	
	@RequestMapping("/refund/{order_no}/{bank}/{account}/{refundmsg}/{refund_price}")
	public String refund(@PathVariable String order_no,@PathVariable String bank, @PathVariable String account, @PathVariable String refundmsg,@PathVariable String refund_price) {
		
		OrderListDTO dto = new OrderListDTO();
		dto.setOrder_no(Integer.parseInt(order_no));
		dto.setRefund_bank(bank);
		dto.setRefund_account(account);
		dto.setRefund_msg(refundmsg);
		dto.setRefund_price(Integer.parseInt(refund_price));
		
		mpservice.refund(dto);
		
		
		// orderlist dto 객체 생성 ( id가져오고,dto값 넣기 , pathva 값들 dto에 넣기)
		
		
		// orderlist의 delivery_state  위에잇는거 변경
		
		// order_no에 대한 price 를 변경
		
		
		return "redirect:/mypage/order";
	}

	
	
}


