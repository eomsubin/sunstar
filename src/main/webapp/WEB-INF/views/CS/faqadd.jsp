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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/faqadd.css" />
<title>SBBJ - FAQ </title>
<script>

</script>
</head>
<body>
                <div class="col-sm-9">
                    <div id="gocont">
        <form id="faqForm" name="faqForm" action="${pageContext.request.contextPath}/faqadd/add" method="post">
          <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
           
            <fieldset>
                <legend class="blind pb-4"><h5>FAQ 등록</h5>
                </legend>
                <div class="tbl inplist">
                      <table> 
                        <tbody id="categoryBody">
                           <!-- 카테고리 -->
                            <tr>
                                <th scope="row">
                                    <label for="categoryArea">
                                  		FAQ 분류
                                    </label>
                                </th>
                                <td>
                                    <div id="categoryArea" style="overflow: hidden;">
                                        <span class="sel" style="width: 198px;">
                                            <select id="upperCategory" required="required" name="faq_category">
                                                <option value="">FAQ분류 선택</option>
                                                <option value="회원정보">회원정보</option>
                                                <option value="상품">상품</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
						 <tbody id="headBody">
                           <!-- 카테고리 -->
                            <tr>
                                <th scope="row">
                                    <label for="headArea">
                                  		FAQ 말머리
                                    </label>
                                </th>
                                <td>
                                    <div id="categoryArea" style="overflow: hidden;">
                                        <span class="sel" style="width: 198px;">
                                            <select id="upperHead" required="required" name="faq_head">
                                                <option value="">말머리 선택</option>
                                                <option value="HOT">HOT</option>
                                                <option value="정보변경">정보변경</option>
                                                <option value="비밀번호변경">비밀번호 변경</option>
                                                <option value="탈퇴">탈퇴</option>
                                                <option value="주문">주문</option>
                                                <option value="결제">결제</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tbody id="itemBody">
                            <!-- FAQ 제목 -->
                            <tr class="itemArea TEXT">
                                <th scope="row">
                                    <label for="faqTitle" class="thin_ic">
                                        <span class="itemExpression">제목</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <span class="help_txt"></span>
                                        <input type="text" name="faq_title" class="contents inp" maxlength="100"  required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr class="itemArea HTML">
                                <th scope="row">
                                    <label for="faqContent" class="thin_ic">
                                        <span class="itemExpression">내용</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <textarea name="faq_content" class="contents inp" cols="30" rows="4" maxlength="5000" required="required"></textarea>                                                                                   </textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        
        <div class="bn_wrap v2">
            <span><input type="submit" id="btnSend" value="등록"></input></span>
            <span><a href="${pageContext.request.contextPath}/faq" id="btnCancel">취소</a></span>
        </div>
        </form>
    </div>
                </div>
                <div class="adjust" style="margin-bottom: 10%"></div>
</body>
</html>