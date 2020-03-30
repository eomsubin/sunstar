package com.sunstar.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunstar.dto.CartDTO;
import com.sunstar.dto.CategoryDTO;
import com.sunstar.dto.ChartDTO;
import com.sunstar.dto.MakePage;
import com.sunstar.dto.OptionDTO;
import com.sunstar.dto.OrderDTO;
import com.sunstar.dto.ProductDTO;
import com.sunstar.dto.QnaDTO;
import com.sunstar.dto.ReviewDTO;
import com.sunstar.dto.ReviewImgDTO;
import com.sunstar.dto.SellerDTO;
import com.sunstar.mapper.SellerMapper;

@Service("sellerservice")
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper mapper;

	@Override
	public List<CategoryDTO> getCategory() {
		return mapper.getCategory();
	}

	@Override
	public int getCategoryCount() {
		// TODO Auto-generated method stub
		return mapper.getCategoryCount();
	}

	@Override
	public void addProduct(ProductDTO dto) {
		//상품코드 생성
		mapper.addProduct(dto);
		
		System.out.println("--------------------\n\n"+dto+"-------------------------");
		if(dto.getOptions().size()==0) {

		}else {
			//옵션 수만큼 반복
			for(int i =0; i<dto.getOptions().size(); i++) {
				
				
				//상품코드 불러와서
			//	ProductDTO dto2 = mapper.aProduct();
				//그 상품코드에 맞는 옵션 추가
				System.out.println("****");
				OptionDTO dto2 = new OptionDTO();
				dto2.setProduct_code(mapper.aProduct());
				if(dto.getOptions().get(i).getOption1().equals("") && dto.getOptions().get(i).getOption2().equals("")) {
					dto2.setOption1("기본");
					dto2.setOption2("기본");
				}else {
					dto2.setOption1(dto.getOptions().get(i).getOption1());
					dto2.setOption2(dto.getOptions().get(i).getOption2());
				}
				dto2.setInventory(dto.getOptions().get(i).getInventory());
				dto2.setAdd_price(dto.getOptions().get(i).getAdd_price());
				
				System.out.println("dto2 *********************\n" + dto2+"\n**********");
				mapper.addOptions(dto2);
			}
		}
	}

	@Override
	public List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public void deleteProduct(int pcode) {
		//옵션즈 테이블에서 먼저 삭제
		mapper.deleteProductOptions(pcode);
		
		//상품리스트 테이블에서 삭제
		mapper.deleteProduct(pcode);
		
	}
	@Override
	public List<String> getOptioncolor(int pcode) {
		List<String> list = mapper.getOptionColor(pcode);
		

		return list;
	}
	
	@Override
	public void updateinventory(OptionDTO dto) {
		mapper.updateInventory(dto);
	}

	@Override
	public List<OrderDTO> orderlist(String seller_code) {
		return mapper.orderlist(seller_code);
	}
	
	@Override
	public List<OrderDTO> shippinglist(String seller_code) {
		return mapper.shippinglist(seller_code);
	}

	@Override
	public OrderDTO theOrderlist(String order_no) {
		return mapper.theOrderlist(order_no);
	}

	@Override
	public void changeStep(OrderDTO dto) {
		 mapper.changeStep(dto);
	}

	@Override
	public void updateTracking(OrderDTO dto) {
		mapper.updateTracking(dto);		
	}

	@Override
	public SellerDTO sellerInfo(String seller_code) {
		return mapper.sellerInfo(seller_code);
	}

	@Override
	public void changePublicState(ProductDTO dto) {
		mapper.changePublicState(dto);
	}
	
	@Override
	public void changeReviewState(ProductDTO dto) {
		mapper.changeReviewState(dto);
	}

	@Override
	public void changeInfo(SellerDTO dto) {

		mapper.changeInfo(dto);
	}

	@Override
	public int totalCount(String txt) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("txt", txt);
		
		return mapper.getCount(hm);
		
	}

	@Override
	public List<ProductDTO> productlist(MakePage page) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("txt", page.getTxt());
		hm.put("startRow", page.getStartRow());
		hm.put("endRow", page.getEndRow());
		
		System.out.println("emp service impl test");
		

		return mapper.productlist(page);
	}

	@Override
	public void update_seller_info(SellerDTO dto) {

		mapper.update_seller_info(dto);
	}

	@Override
	public List<ProductDTO> product_list_user(String seller_code) {
		return mapper.product_list_user(seller_code);
	}

	@Override
	public List<OrderDTO> viewStepOrder(String view_step) {
		return mapper.viewStepOrder(view_step);
	}

	@Override
	public List<ProductDTO> viewProduct(int pcd) {
		// TODO Auto-generated method stub
		return mapper.viewProduct(pcd);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		mapper.updateProduct(dto);
	}

	@Override
	public List<OrderDTO> getDayProfit(String order_code) {
		// TODO Auto-generated method stub
		return mapper.getDayProfit(order_code);
	}

	@Override
	public int getShipping_Cost(int seller_code) {
		// TODO Auto-generated method stub
		return mapper.getShipping_Cost(seller_code);
	}
	

	@Override
	public String getSellerCode(String id) {
		
		return mapper.getSellerCode(id);
	}

	

	@Override
	public int getPaid(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getPaid(seller_code);
	}

	@Override
	public int getReadyCount(String seller_code) {
		return mapper.getReadyCount(seller_code);
	}

	@Override
	public int getExchangeCount(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getExchangeCount(seller_code);
	}

	@Override
	public int getBringBack(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getBringBack(seller_code);
	}

	@Override
	public int getWaitAnswer(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getWaitAnswer(seller_code);
	}

	@Override
	public List<QnaDTO> getQnaList(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getQnaList(seller_code);
	}

	@Override
	public void qna_reply(QnaDTO dto) {
		// TODO Auto-generated method stub
		mapper.qna_reply(dto);
	}

	@Override
	public List<OrderDTO> searchOrderView(String search_order) {
		return mapper.searchOrderView(search_order);
	}

	@Override
	public List<ReviewDTO> getReview(String seller_code) {
		// TODO Auto-generated method stub
		return mapper.getReview(seller_code);
	}

	@Override
	public List<ReviewImgDTO> getReviewImgCount(int review_no) {
		// TODO Auto-generated method stub
		return mapper.getReviewImgCount(review_no);
	}

	@Override
	public void review_del(int review_no) {
		
		//review_img 테이블에서 먼저 삭제한 후 review 테이블에서 삭제@
		mapper.reviewimg_del(review_no);
		mapper.review_del(review_no);
	}

	@Override
	public Integer month_chart(ChartDTO dto) {
		return mapper.month_chart(dto);
	}
	@Override
	public Integer month_chart_plus(ChartDTO dto) {
		return mapper.month_chart_plus(dto);
	}

	@Override
	public Integer day_chart(ChartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.day_chart(dto);
	}

	@Override
	public Integer day_chart_plus(ChartDTO dto) {
		// TODO Auto-generated method stub
		return  mapper.day_chart_plus(dto);
	}
	
	

}                                                                                                                                                         
		
		
		
		

		
		
		