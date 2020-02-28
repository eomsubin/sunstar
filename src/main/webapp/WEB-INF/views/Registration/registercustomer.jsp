<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.custom-control-input:checked~.custom-control-label::before {
    color: #fff;
    border-color: #fbab60;
    background-color: #fbab60;
}

input[type="submit"] {
	color : white;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
}

.regh1 {
	font-weight : 300;
	display: inline-block;
	margin-right: 5%;
	margin-bottom: 5%;
}

.regspan {
	margin-left: 24px;
	font-weight: bold;
}

.reg_formbox {
	border: 1px solid silver;
	border-radius : 1px;
	padding: 10px 1px 10px 1px !important;
	margin-bottom: 10px;
}
 
 .custom-control-input {
	margin-left: 10px;
} 

.reg_txt {
    color: #999;
    font-size: 11px;
    letter-spacing: -1px;
    line-height: 17px;
    
}

.inner_txt {
    padding: 5px 0 0 29px;
    color: #999;
    font-size: 11px;
    line-height: 17px;
    letter-spacing: -0.05em;
}

.txt_required {
	color: #fbab60;
}

.regbtn { 
	height: 60px; 
	margin: 10px auto;
	display: flex;
	padding : 0px 50px;
	margin-top: 50px;
}

.now {
	color: #fbab60;
	border-top: 2px solid #fbab60;
}
</style>
<script>
	$(document).ready(function(){
		$('#CheckAll').click(function(){
			if($('#CheckAll').prop('checked')){
				$('input[type=checkbox]').prop('checked',true);
				console.log("true");
			}else{
				$('input[type=checkbox]').prop('checked',false);
				console.log("false");
			}
		});
	});
</script>
</head>
<body>
<div class="mx-auto mb-5 row align-items-center " style="width: 600px; height: 808px;">
		<div class="col">
		<h1 class="regh1">구매 회원가입</h1><span class="regspan now">1 약관동의</span><span class="regspan">2 정보입력</span><span class="regspan">3 가입완료</span>
		
		<p class="txx_info">스삐제 구매회원/전자금융서비스 이용약관과 개인정보 수집 및 이용에 동의를 하셔야 회원가입이 가능합니다.</p>
		<form method="post" action="${pageContext.request.contextPath}/registercustomer/info">
				<div class="reg_formbox">
				<div class="custom-control custom-checkbox">
				<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="CheckAll">
  				<label class="custom-control-label" for="CheckAll">전체동의</label>
  				</div>
				<hr>
				<p class="txt_required">필수 동의항목</p>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="Checkagree1" name="Checkagree1">
  				<label class="custom-control-label" for="Checkagree1">쓰삐제 구매회원 이용약관</label>
  				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="Checkagree2" name="Checkagree2">
  				<label class="custom-control-label" for="Checkagree2">전자금융서비스 이용약관</label>
  				</div>
  				<div class="custom-control custom-checkbox">
  				<input type="checkbox" class="custom-control-input" id="Checkagree3" name="Checkagree3">
  				<label class="custom-control-label" for="Checkagree3">개인정보 수집 및 이용</label>
				</div>
				
				
				<br>
				<p class="txt_required">선택 동의항목</p>
				<div class="custom-control custom-checkbox">
  				<input type="checkbox" class="custom-control-input" id="Checkagree4" name="Checkagree4">
  				<label class="custom-control-label" for="Checkagree4">개인정보 제3자 제공동의</label>
				</div>
				<div class="custom-control custom-checkbox">
  				<input type="checkbox" class="custom-control-input" id="Checkagree5" name="Checkagree5">
  				<label class="custom-control-label" for="Checkagree5">쇼핑 이메일 수신</label>
				</div>
				<div class="custom-control custom-checkbox">
  				<input type="checkbox" class="custom-control-input" id="Checkagree6" name="Checkagree6">
  				<label class="custom-control-label" for="Checkagree6">쇼핑 SMS 수신</label>
				</div>
				</div>
				<p class="inner_txt">할인쿠폰, 특가상품 이벤트 정보를 받아보실 수 있습니다.
				<br>(단, 거래정보-결제/교환/환불 등과 관련된 내용은 거래안전을 위하여 수신동의 여부와 관계없이 발송됩니다.)</p>
				
				</div>
				<p class="reg_txt">＊선택 동의항목에 동의하지 않으셔도 상품검색 등의 일반적인 서비스는 이용하실 수 있습니다.
				<br>＊가입은 14세 이상 고객만 가능합니다.</p>
				<input class="btn btn-secondary regbtn" type="submit" value="동의하고 회원가입">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		</div>
	</div>
</body>
</html>