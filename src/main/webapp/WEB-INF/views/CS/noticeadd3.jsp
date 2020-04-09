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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/noticeadd.css" />
<title>SBBJ - 공지사항 작성</title>
<script>

</script>
</head>
<body>
                <div class="col-sm-9">
                    <div id="gocont">
        <form id="noticeForm" name="noticeForm" action="${pageContext.request.contextPath}/noticeadd/add" method="post">
          <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
           
            <fieldset>
                <legend class="blind pb-4"><h5>공지사항 등록</h5>
                </legend>
                <div class="tbl inplist">
                      <table> 
                        <tbody id="categoryBody">
                           <!-- 공지카테고리 -->
                            <tr>
                                <th scope="row">
                                    <label for="categoryArea">
                                  		      공지 분류
                                    </label>
                                </th>
                                <td>
                                    <div id="categoryArea" style="overflow: hidden;">
                                        <span class="sel" style="width: 198px;">
                                            <select id="upperCategory" required="required" name="notice_category">
                                                <option value="">공지분류 선택</option>
                                                <option value="일반">일반</option>
                                                <option value="안전">안전거래</option>
                                                <option value="위해">위해상품</option>
                                            </select>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tbody id="itemBody">
                            <!-- 공지 제목 -->
                            <tr class="itemArea TEXT">
                                <th scope="row">
                                    <label for="noticeTitle" class="thin_ic">
                                        <span class="itemExpression">제목</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <span class="help_txt"></span>
                                        <input type="text" name="notice_title" class="contents inp" maxlength="100"  required="required">
                                    </div>
                                </td>
                            </tr>
                            <tr class="itemArea HTML">
                                <th scope="row">
                                    <label for="noticeContent" class="thin_ic">
                                        <span class="itemExpression">내용</span>
                                    </label>
                                </th>
                                <td>
                                    <div class="pr">
                                        <textarea name="notice_content" class="contents inp" cols="30" rows="4" maxlength="5000" required="required"></textarea>                                                                                   </textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        
        <div class="bn_wrap v2">
            <span><input type="submit" id="btnSend" value="등록"></input></span>
            <span><a href="${pageContext.request.contextPath}/notice" id="btnCancel">취소</a></span>
        </div>
        </form>
    </div>

                </div>
</body>
</html>