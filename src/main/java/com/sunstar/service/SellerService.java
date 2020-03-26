package com.sunstar.service;

import java.util.List;

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

public interface SellerService {

	List<CategoryDTO> getCategory();

	int getCategoryCount();

	void addProduct(ProductDTO dto);

	List<ProductDTO> list();

	void deleteProduct(int pcode);

	List<String> getOptioncolor(int pcode);
	
	void updateinventory(OptionDTO dto);

	List<OrderDTO> orderlist(String seller_code);

	List<OrderDTO> shippinglist(String seller_code);

	OrderDTO theOrderlist(String order_code);

	void changeStep(OrderDTO dto);

	void updateTracking(OrderDTO dto);

	SellerDTO sellerInfo(String seller_code);

	void changePublicState(ProductDTO dto);
	
	void changeReviewState(ProductDTO dto);

	void changeInfo(SellerDTO dto);

	int totalCount(String txt);

	List<ProductDTO> productlist(MakePage page);

	void update_seller_info(SellerDTO dto);

	List<ProductDTO> product_list_user();

	List<OrderDTO> viewStepOrder(String view_step);

	List<ProductDTO> viewProduct(int pcd);

	void updateProduct(ProductDTO dto);

	List<OrderDTO> getDayProfit(String order_code);

	int getShipping_Cost(int seller_code);

	String getSellerCode(String id);
	
	int getReadyCount(String seller_code);

	int getExchangeCount(String seller_code);

	int getBringBack(String seller_code);

	int getWaitAnswer(String seller_code);

	List<QnaDTO> getQnaList(String seller_code);

	void qna_reply(QnaDTO dto);

	int getPaid(String seller_code);

	List<OrderDTO> searchOrderView(String search_order);

	List<ReviewDTO> getReview(String seller_code);

	List<ReviewImgDTO> getReviewImgCount(int review_no);

	void review_del(int review_no);

	Integer month_chart(ChartDTO dto);




}
