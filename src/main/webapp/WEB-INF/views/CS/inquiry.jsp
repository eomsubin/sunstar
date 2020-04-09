<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/inquiry.css" />
<title>SBBJ - 문의하기 </title>
<script>

function goPopup(){
	id=$('input:hidden[name="userinfo"]').data("id");
    var pop = window.open("${pageContext.request.contextPath}/CS/orderList/"+id,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	 
};

function jusoCallBack(order_code)
{
		$('#orderno1').val(order_code);
}
	$(document).ready(function(){
		var id=$('input:hidden[name="userinfo"]').data("id");
		var email1 = $('input:hidden[name="userinfo"]').data("email").split("@",1);
		var email2 = $('input:hidden[name="userinfo"]').data("email").split("@").reverse()[0]
		
		//user이메일 가져오기
		$('.emailId').val(email1);
		$('.emailDomain').val(email2);
		
		/*
		 <input type="text" class="emailDomain inp" style="width:133px" title="이메일 계정 입력" required="required">
         <span class="sel ml" style="width:100px">
             <select class="emailDomainType" title="이메일 계정" required="required">
             <option value="1">직접입력</option>
             <option value="naver.com">naver.com</option>
             <option value="daum.net">daum.net</option>
             <option value="nate.com">nate.com</option>
             <option value="gmail.com">gmail.com</option>
             <option value="hotmail.com">hotmail.com</option>
             <option value="outlook.com">outlook.com</option>
             <option value="yahoo.com">yahoo.com</option>
             </select>
          </span>*/
          
          
          //이메일 도메인 변경
          $('.emailDomainType').change(function(){
            var domain=$(this).val();
                  if($(this).val() =='1'){
                     $('.emailDomain').attr("disabled",false)
                     $('.emailDomain').val('');
                  }else{
                     $('.emailDomain').val(domain);
                     $('.emailDomain').attr("disabled",true)
                  } 
           });

          
          //이메일 보내기
          $("#btnSend").on("click",function(){
        	  var email1 =  $('.emailId').val()
              var email2 = $('.emailDomain').val()
           }); 
	});
</script>
</head>
<body>
		<input type="hidden" data-email="<sec:authentication property='principal.UserInfo.email'/>" data-id="<sec:authentication property='principal.UserInfo.id'/>" name="userinfo">

                <div class="col-sm-9">
                    <div id="gocont">
        <form id="inquiryForm" name="inquiryForm" action="${pageContext.request.contextPath}/CS/inquiry/add" method="post">
          <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
           
            <fieldset>
                <legend class="blind"><h5>1:1 문의하기</h5>
                 <p class="ess mt"><span class="bl_ess">필수</span>  항목은 필수입력 항목입니다.</p>
                </legend>
                <div class="tbl inplist">
                    <table>
                        <colgroup>
                            <col style="width:170px">
                            <col style="width:540px">
                        </colgroup>
                        
                        <h3 class="subtitle">회원정보</h3>
                        <tbody id="userBody">
                          <!-- 아이디-->
                           <tr>
                           <th scope="row"><label for="customerID"><span class="itemExpression">아이디</span></label></th>
                           <td><div><input type="text" id="id" name="id" value="<sec:authentication property="principal.UserInfo.id"/>" readonly="readonly" ></div></td>
                          
                           </tr>
                           
                            <!-- 이메일 -->
                            <tr class="itemArea EMAIL">
                                <th scope="row">
                                    <label for="customerEmail">
                                        <span class="bl_ess">필수</span>
                                        <span class="itemExpression">이메일</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="email input" style="display: none;">
                                        <span class="emailIput" style="width:230px;font-weight:bold;font-size:15px;"></span>
                                        <span style="border-color:#bfbfbf;background:#fff;color:#191a1c;width:58px;height:28px;border-width:1px;border-style:solid;display:inline-block;margin:0 1px 0 0;vertical-align:top;">
                                            <button type="button" class="btnEmail input" style="color:#191a1c;font-size:12px;line-height:28px;text-align:center;display:block;width:100%;height:100%;cursor:pointer;text-decoration:none !important">수정</button>
                                        </span>
                                    </div>
                                    <div class="email complete" style="display: block;">
                                        <input type="text" class="emailId inp" style="width:133px" name="email1">
                                        <span class="mid">@</span>
                                        <input type="text" class="emailDomain inp" name="email2" style="width:133px" title="이메일 계정 입력" required="required" data-domain='domain' >
                                        <span class="sel ml" style="width:100px">
                                            <select class="emailDomainType" title="이메일 계정" required="required">
                                                <option value="1">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="outlook.com">outlook.com</option>
                                                <option value="yahoo.com">yahoo.com</option>
                                            </select>
                                        </span>
                                        <p class="alram_txt">문의하신 내용의 답변 완료 시 이메일로 알려드립니다.</p>
                                        <span class="spanEmail complete" style="border-color: rgb(191, 191, 191); background: rgb(255, 255, 255); color: rgb(25, 26, 28); width: 58px; height: 28px; border-width: 1px; border-style: solid; display: none; margin: 0px 1px 0px 0px; vertical-align: top;">
                                            <button type="button" class="btnEmail complete" style="color:#191a1c;font-size:12px;line-height:28px;text-align:center;display:block;width:100%;height:100%;cursor:pointer;text-decoration:none !important">확인</button>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
            </table>

                     <h3 class="subtitle">주문정보</h3>
                      <table> 
                        <tbody id="categoryBody">
                           <!-- 문의카테고리 -->
                            <tr>
                                <th scope="row">
                                    <label for="categoryArea">
                                        <span class="bl_ess">필수</span>
                                  		      문의유형
                                    </label>
                                </th>
                                <td>
                                    <div id="categoryArea" style="overflow: hidden;">
                                        <span class="sel" style="width: 198px;">
                                            <select id="upperCategory" required="required" name="category">
                                                <option value="">문의유형 선택</option>
                                                <option value="회원정보">회원정보</option>
                                                <option value="탈퇴">탈퇴</option>
                                                <option value="주문">주문</option>
                                                <option value="결제">결제</option>
                                                <option value="고객센터">고객센터</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <!-- 주문번호 조회-->
                        <tbody id="searchOrderBody">
                            <tr>
                             <th scope="row"><label>주문조회</label></th>
                             <td><span class="input-box"><input name="order_code" type="text" id="orderno1" class="txt" maxlength="10" style="width: 133px;" ></span>
        					 <span class="ordercode_btn"><a href="javascript:goPopup()">주문조회 </a><%-- <button onclick="goPopup(<sec:authentication property='principal.UserInfo.id'/>)">주문조회</button></span></td><!--a href="javascript:goPopup;" --> --%>
                            </tr>
                        </tbody>
                        
                        

                        <tbody id="itemBody">
                            <!-- 문의 제목 -->
                            <tr class="itemArea TEXT">
                                <th scope="row">
                                    <label for="inquiryTitle" class="thin_ic">
                                        <span class="bl_ess">필수</span>
                                        <span class="itemExpression">문의제목</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <span class="help_txt"></span>
                                        <input type="text" name="title" class="contents inp" maxlength="100"  required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr class="itemArea HTML">
                                <th scope="row">
                                    <label for="inquiryContent" class="thin_ic">
                                        <span class="bl_ess">필수</span>
                                        <span class="itemExpression">문의내용</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <textarea name="content" class="contents inp" cols="30" rows="4" maxlength="5000" required="required"></textarea>                                                                                   </textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        
        <div class="bn_wrap v2">
            <span><input type="submit" id="btnSend" value="확인"></input></span>
            <span><a href="${pageContext.request.contextPath}/CS" id="btnCancel">취소</a></span>
        </div>
        </form>
    </div>
    <%-- <sec:authentication property="principal.UserInfo" /> --%>
                </div>
                <div class="adjust" style="margin-bottom: 10%"></div>
</body>
</html>