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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/inquiry.css" />
<title>SBBJ - 고객센터 </title>
</head>
<script>
	$(document).ready(function(){
		var id=$('input:hidden[name="userinfo"]').data("id");
		var email1 = $('input:hidden[name="userinfo"]').data("email").split("@",1);
		var email2 = $('input:hidden[name="userinfo"]').data("email").split("@").reverse()[0]
		
		
		//이메일 폼 넣기
		$('.emailId').val(email1);
		$('.emailDomain').val(email2);

 		  $("#btnSend").on("click",function(){
 			$('email').val(email1+"@"+email2);
	        }); 
		 
		
	});
</script>
<body>
	<div class="container p-0">

<sec:authentication property="principal.UserInfo" />
		<input type="hidden" data-email="<sec:authentication property='principal.UserInfo.email'/>" data-id="<sec:authentication property='principal.UserInfo.id'/>" name="userinfo">
	
 
		<div id="contenttop">
			<ul class="headnav nav nav-pills nav-fill">
				<li class="nav-item col-sm-3"><a class="nav-link" href="${pageContext.request.contextPath}/CS"
					style="color: white; font-size: 28px; font-weight: 600">고객센터</a></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-address-card fa-2x"></i></a> <br> <span> <a
						href="#">정보변경</a><br> <a href="#">비밀번호 변경</a><br> <a
						href="#">탈퇴</a>
				</span></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-credit-card fa-2x"></i></a> <br> <span> <a
						href="#">주문</a><br> <a href="#">결제</a><br>
				</span></li>

				<li class="nav-item col-sm-3 my-3" style="border: 0px"><a
					href="#"><i class="far fa-question-circle fa-2x"></i></a> <br>
					<span> <a href="#">고객센터</a><br> <a href="#">기타</a><br>
				</span></li>
			</ul>
		</div>
	</div>
	<div class="container p-0 mt-3 jinwoo">
		<div id="contentbody">
			<div class="row px-3">
				<div class="side col-sm-3">
					<nav class="sidenav nav flex-column px-3">
					<li><a class="nav-link active" href="#">자주 묻는 질문</a></li>
					<li><a class="nav-link" href="${pageContext.request.contextPath}/inquiry">1:1 문의하기</a></li>
					<li><a class="nav-link" href="#">나의 문의 확인</a></li>
					<li><a class="nav-link" href="#">고객센터 이용안내</a></li>
					<li><a class="nav-link" href="${pageContext.request.contextPath}/notice">공지사항</a></li>
					<section class="time mt-4 p-3 bg-light">
					<h5>
						고객센터<br>업무시간
					</h5>
					<p>
						<strong>09:00~18:00 <span>(평일)</span></strong><br> <em>주말/공휴일
							휴무</em><br> <em>1:1문의 24시간 접수</em>
					</p>
					<p class="desc">
						업무시간 외에는<br> 자주 묻는 질문<br> 또는 1:1문의를<br> 이용해 주세요
					</p>
					</section> </nav>
				</div>

                <div class="col-sm-9">
                    <div id="gocont">
        <form id="inquiryForm" name="inquiryForm" action="inquiry/add" method="post">
          <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
            <fieldset>
                <legend class="blind">1:1 문의하기
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
                                        <input type="text" class="emailId inp" style="width:133px" name="email">
                                        <span class="mid">@</span>
                                        <input type="text" class="emailDomain inp" style="width:133px" title="이메일 계정 입력" required="required">
                                        <span class="sel ml" style="width:100px">
                                            <select class="emailDomainType" title="이메일 계정" required="required">
                                                <option value="another">직접입력</option>
                                                <option>naver.com</option>
                                                <option>daum.net</option>
                                                <option>nate.com</option>
                                                <option>gmail.com</option>
                                                <option>hotmail.com</option>
                                                <option>outlook.com</option>
                                                <option>yahoo.com</option>
                                                <option>korea.com</option>
                                                <option>dreamwiz.com</option>
                                                <option>chol.com</option>
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
                                                <option value="5730">회원정보</option>
                                                <option value="5731">탈퇴</option>
                                                <option value="5732">주문</option>
                                                <option value="5733">결제</option>
                                                <option value="5734">고객센터</option>
                                                <option value="5934">기타</option>
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
        <span class="ordercode_btn"><a href="#">주문조회</a></span></td><!--a href="javascript:tractionpopup();" -->
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
            <span><input type="submit" id="btnSend" value="제출"></input></span>
            <span><a href="#" id="btnCancel">취소</a></span>
        </div>
        </form>
    </div>
                </div>
			</div>
		</div>
	</div>

</body>
</html>