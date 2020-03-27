package com.sunstar.controller;

import static org.junit.Assert.assertArrayEquals;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.internal.JUnitSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.CustomerDTO;
import com.sunstar.dto.CustomerUserDetail;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.OrderListDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.service.MainService;
import com.sunstar.service.MyPageService;
import com.sunstar.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired
	private MainService mainservice;
	@Autowired
	private PaymentService paymentservice;

	@Autowired
	private MyPageService mpservice;



	/*private List<CartDTO> justbuylist=new ArrayList<>();
	@ResponseBody
	@RequestMapping(value="/checkout2",method=RequestMethod.POST)
	private List<CartDTO> checkout2(@RequestBody List<CartDTO> a ){
		
		
		justbuylist = a;
		
		
		return justbuylist;
	}*/
	
	
	
	// 카트에서의 값가지고 주문페이지 넘어가기
	@RequestMapping(value="/checkout", method = {RequestMethod.POST,RequestMethod.GET})
	public String checkout( Model model, Principal principal, @RequestParam String[] cart_no)
	{		

		mainservice.header(model);
		
			/*//판매자 코드가 일치하는 리뷰 테이블에서 값을 받아옴
			List<CartDTO> clist = paymentservice.viewOrdered(id);
			System.out.println("view___ordered_____\n\n"+ clist + "\n\n");
			List<CartDTO> slist = new ArrayList<>();

			List<String>  product_count=new ArrayList<>();
			for(int i=0;i<clist.size();i++) {
		//		int cart_no = clist.get(i).getCart_no();
		//		int cart_n = Integer.parseInt(cart_no[i]);
						
				
				product_count=paymentservice.getProductCount(id) ;
				System.out.println("product_count value    " + product_count +"\n\n");
				
				String[] datas = product_count.get(i).split("..");

				
				//stk nexttoken = 1  --> 한번만 실행시킬꺼야
				// 두번쨰꺼가 11111 	  -> 두번째꺼는 		
				int cycle = Integer.parseInt(datas[0]);
				clist.get(i).setSeller_code(datas[1]);
				//1..11111
				//3..22222
				
				for(int j = 0;  j < cycle; j++) {
					//clist의 셀러코드와 slist의 셀러코드가 같다면.. 
					//slist의 값을 clist.setPdto(여기에 넣어
					
					slist= paymentservice.getProducts(clist);
					System.out.println("slist -- "+slist +"slist");

					clist.get(i).setPdto(slist);
					System.out.println("clist -- "+clist +"clist");

				}
			}
			
			System.out.println("최종~~~~~~~~~~~~~ \n\n\n\n\n" + clist +"\n\\n\\n\\n\\n");
			m.addAttribute("clist",clist);
			m.addAttribute("sellerpage", "product_review.jsp");
			return "sellers/temp";
		}
*/
mainservice.header(model);
		
		if(principal!=null) {
			CustomerUserDetail userdetail = (CustomerUserDetail)((Authentication)principal).getPrincipal();
			String id = userdetail.getUsername();
			
	
			
			CustomerDTO info = mpservice.getUserInfo(id);
			info.setTel(info.getTel().replaceAll("-", ""));
			CartDTO userinfo= new CartDTO();
			
			userinfo.setId(id);
			System.out.println("cart의 아이디:"+id);
			
			int cart_no1=0;
			
			List<CartDTO> list = new ArrayList<>();
			List<CartDTO> plist = new ArrayList<>();
			for(String i: cart_no) {
				cart_no1=Integer.parseInt(i);
				
				System.out.println(cart_no1);
				userinfo.setCart_no(cart_no1);
				System.out.println("cart_no:"+ userinfo);
				
				
				CartDTO orderdto = paymentservice.viewOrdered(userinfo);
				
			
				CartDTO cpdto = new CartDTO();
				cpdto.setSeller_code(orderdto.getSeller_code());
				cpdto.setId(orderdto.getId());
				
				CartDTO pdto= paymentservice.getProducts(cpdto);
				
				list.add(orderdto);
				plist.add(pdto);
			}
			
			
			
			System.out.println("plist:  "+ plist);
			System.out.println("list:  "+list);
			
			
			
			model.addAttribute("odto",list);
			//model.addAttribute("pdto",plist);
			//model.addAttribute("odto2",orderdto);
		
			model.addAttribute("userinfo",info);
			
			model.addAttribute("contentpage", "payment/checkout.jsp");       
		}else {
			return "redirect:/userlogin";
		}
		return "home";
	

	}

	// 결제 완료 후 데이터 받아와서 주문 목록에 추가하기
	@ResponseBody
	@RequestMapping(value="/checkout/complete",method=RequestMethod.POST)
	public int complete(Model model, @RequestBody OrderDTO allData) {
		int r=0;


		r = paymentservice.addOrder(allData);
		

		return r;
	}
	
	
	




}