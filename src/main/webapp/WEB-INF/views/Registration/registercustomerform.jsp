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

.regbtn{
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
	/* border: 1px solid silver; */
	border-radius : 1px;
	margin-bottom: 10px;
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

.list-group-item {
	border-radius: 0px !important;
}

input, select{
	border : 0px white solid !important;
}

.tel {
	border-right: 1px solid silver !important;
	letter-spacing: 3px;
}

.telck{
	border-bottom: 1px solid silver !important;
}
#tel1, #tel2{
	letter-spacing: 3px;
}

#email2 {
	border-left: 1px solid silver !important;
}

.alert {
	color: red;
}

.ckalert{
	color: #fbab60;
}
</style>
<script>
	$(document).ready(function(){
		$('#email2').change(function(){
			let str = "";
			str += $('#email2 option:selected').text();
			if(str==="직접입력"){
			$('#email1').val("");
			}else{
			$('#email1').val(str);
			}
		})
		$('.regbtn').click(function(){
			event.preventDefault();
			if(idcheck() && pwcheck() && pwcheck2() && namecheck() && telcheck() && emailcheck() && addrcheck()){
				$('form').submit();
			}
		})		
		// 아이디 조건, 아이디 체크
		var idReg = /^[0-9a-z]+$/; //숫자, 영문만 입력 가능
		$('#id').focusout(idcheck);
		function idcheck(){
			if($('#id').val()===""){
				$('.idalert').remove();
				$('#id').parent().append("<p class='alert idalert p-0 m-0'>필수 정보입니다.</p>");
				return false;
			}
			else if($('#id').val().length<6){
				$('.idalert').remove();
				$('#id').parent().append("<p class='alert idalert p-0 m-0'>회원 아이디(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.</p>");
				return false;
			}else if(!idReg.test($('#id').val())){
				$('.idalert').remove();
				$('#id').parent().append("<p class='alert idalert p-0 m-0'>회원 아이디(ID)는 띄어쓰기 없이 6~10자리의 영문자와 숫자 조합만 가능합니다.</p>");
				return false;
			}else{
				let result = 0;
				$('.idalert').remove();
				let id = $('#id').val();
				$.ajax({
					url : "customeridcheck/"+id
					,dataType : "json"
					,async: false
					,success:function(data){
						result = data;
					}
					,error:function(e){
						console.log(e);
					}
				});
				if(result>0){
					$('#id').parent().append("<p class='alert idalert p-0 m-0'>이미 사용중인 아이디 입니다.</p>");
					return false;
				}else{
					$('#id').parent().append("<p class='ckalert idalert p-0 m-0'>사용가능한 아이디 입니다.</p>");
					return true;
				}
			}
		}
		// 패스워드 조건, 패스워드 체크
		// 비밀번호 규칙 정규식
		var Pwreg = /(?=.*\d{1,15})(?=.*[~`!@#$%\^&*()-+=]{1,15})(?=.*[a-zA-Z]{1,50}).{6,15}$/;// : 숫자, 특문 각 1회 이상, 영문은 1개 이상 사용하여 8자리 이상 입력
		$('#password').focusout(pwcheck);
		function pwcheck(){
			if($('#password').val()===""){
				$('.pwalert').remove();
				$('#password').parent().append("<p class='alert pwalert p-0 m-0'>필수 정보입니다.</p>");
				return false;
			}
			else if($('#password').val().length<6){
				$('.pwalert').remove();
				$('#password').parent().append("<p class='alert pwalert p-0 m-0'>띄어쓰기 없는 6~15자의 숫자, 특문 각 1회 이상, 영문은 1개 이상 사용하여<br> 6자리 이상 입력하셔야 합니다.</p>");
				return false;
			}else if(!Pwreg.test($('#password').val())){
				$('.pwalert').remove();
				$('#password').parent().append("<p class='alert pwalert p-0 m-0'>띄어쓰기 없는 6~15자의 숫자, 특문 각 1회 이상, 영문은 1개 이상 사용하여<br> 6자리 이상 입력하셔야 합니다.</p>");
				return false;
			}else{
				$('.pwalert').remove();
				$('#password').parent().append("<p class='ckalert pwalert p-0 m-0'>안전한 비밀번호 입니다.</p>");
				return true;
			}
		}
		// 패스워드 확인
		$('#password2').focusout(pwcheck2);
		function pwcheck2(){
				if($('#password2').val().length<1){
				$('.pwalert2').remove();
				$('#password2').parent().append("<p class='alert pwalert2 p-0 m-0'>필수 정보입니다.</p>");
				return false;
				}else if($('#password').val()==$('#password2').val())
				{
				$('.pwalert2').remove();
				$('#password2').parent().append("<p class='ckalert pwalert2 p-0 m-0'>비밀번호가 일치합니다.</p>");
				return true;
				}else{
				$('.pwalert2').remove();
				$('#password2').parent().append("<p class='alert pwalert2 p-0 m-0'>비밀번호가 일치하지 않습니다.</p>");
				return false;
				} 
		}
		// 이름 확인
		$('#name').focusout(namecheck);
		var namereg = /^[가-힣a-zA-Z]+$/;
		function namecheck(){
			if($('#name').val()===""){
				$('.namealert').remove();
				$('#name').parent().append("<p class='alert namealert p-0 m-0'>필수 정보입니다.</p>");
				return false;
			}else if(!namereg.test($('#name').val())){
				$('.namealert').remove();
				$('#name').parent().append("<p class='alert namealert p-0 m-0'>이름은 최대 10자이내로 한글/영문만 가능합니다.</p>");
				return false;
			}else{
				$('.namealert').remove();
				return true;
			}
		}
		// 전화번호 확인
		$('#tel1').focusout(telcheck);
		$('#tel2').focusout(telcheck);
		var telreg = /^[0-9]+$/
		function telcheck(){
			if($('#tel1').val().length<3 || $('#tel2').val().length<4){
				$('.telalert').remove();
				$('#tel').parent().append("<p class='alert telalert p-0 my-2 ml-3'>전화번호를 정확히 입력해 주세요.</p>");
				$('#tel').addClass("telck");
				return false;
			}else if(!telreg.test($('#tel1').val()) || !telreg.test($('#tel2').val())){
				$('.telalert').remove();
				$('#tel').parent().append("<p class='alert telalert p-0 my-2 ml-3'>전화번호를 정확히 입력해 주세요.</p>");
				$('#tel').addClass("telck");
				return false;
			}else{
				$('.telalert').remove();
				$('#tel').removeClass("telck");
				return true;
			}	
		}
		// 이메일 확인
		var Emreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$('#email').focusout(emailcheck);
		$('#email1').focusout(emailcheck);
		$('#email2').change(emailcheck);
		function emailcheck(){
			var email = $('#email').val();
			email += "@";
			email += $('#email1').val();
			if(!Emreg.test(email)){
				$('.emailalert').remove();
				$('#email2').addClass("telck");
				$('#email').parent().append("<p class='alert emailalert p-0 my-2 ml-3'>이메일 주소를 다시 확인해주세요.</p>");
				return false;
			}else{
				var result = 0;
				$('.emailalert').remove();
				$.ajax({
					url : "customeremailcheck"
					,data : {"email" : email}
					,dataType : "json"
					,async: false
					,success:function(data){
						console.log(data);
						result = data;
					}
					,error:function(e){
						console.log(e);
						return false;
					}
				});
				if(result>0){
					$('#email').parent().append("<p class='alert emailalert p-0 my-2 ml-3'>이미 사용중인 이메일 주소 입니다.</p>");
					return false;
				}else{
					$('#email2').removeClass("telck");
					return true;
				}
			}
		};
		// 주소 확인
		function addrcheck(){
			console.log($('#zipNo').val());
			if($('#zipNo').val().length<1){
				alert('주소를 입력해주세요')
				return false;
			}else{
				return true;
			}
		}
		
		$('.addrinput').click(function(){
			goPopup();
		});
	});
	// 팝업 API
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    var pop = window.open("${pageContext.request.contextPath}/addr","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	};
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log("roadAddrPart1", roadAddrPart1);
		console.log("addrDetail", addrDetail);
		console.log("roadAddrPart2", roadAddrPart2);
		console.log("zipNo", zipNo);
		console.log($('#roadAddrPart1').val(roadAddrPart1));
		console.log($('#roadAddrPart2').val(roadAddrPart2));
		console.log($('#addrDetail').val(addrDetail));
		console.log($('#zipNo').val(zipNo));
	};
</script>
</head>
<body>
<div class="mx-auto mt-5 row align-items-bottom" style="width: 600px; height: 138px;">
<div class="col">
		<h1 class="regh1">구매 회원가입</h1><span class="regspan">1 약관동의</span><span class="regspan now">2 정보입력</span><span class="regspan">3 가입완료</span>
		<p class="txt_info">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
		</div>
		</div>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col">
		<form method="post" action="${pageContext.request.contextPath}/registercustomer/insertcustomer">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				${_csrf.token}
				<div class="reg_formbox py-0">
				<ul class="list-group">
				  	<li class="list-group-item"><input style="width: 450px;" type="text" name="id" id="id" placeholder="ID를 만들어주세요. 띄어쓰기 없이 영/숫자 6-10자" maxlength="10"></li>
				  	<li class="list-group-item"><input style="width: 450px;" type="password" name="password" id="password" placeholder="비밀번호 입력 6-15자의 영문 대소문자, 숫자 및 특수문자 조합" maxlength="15"></li>
				  	<li class="list-group-item"><input style="width: 450px;" type="password" name="password2" id="password2" placeholder="위의 비밀번호를 다시 입력해주세요." maxlength="15"></li>
				  	<li class="list-group-item"><input style="width: 450px;" type="text" name="name" id="name" placeholder="이름" maxlength="10"></li>			
				  	<li class="list-group-item p-0">
				  	<div class="input-group">
  					 <select id="tel" name="tel" class="p-3 tel">
  					 	<option value="010" selected="selected">010</option>
  					 	<option value="016">016</option>
  					 	<option value="017">017</option>
  					 	<option value="018">018</option>
  					 	<option value="019">019</option>
  					 </select>
  					<input type="text" style="width: 50px;" class="mx-3" name="tel1" id="tel1" maxlength="4">
  					<p class="my-auto"> - </p>
  					<input type="text" class="ml-3" name="tel2" id="tel2" maxlength="4" style="width: 280px;">
				 	</div>
				 	</li>
				 	
				 	<li class="list-group-item p-0">
				 	<div class="input-group">
				 	<input type="text" style="width: 180px;" class="email mx-3" name="email" id="email" maxlength="15" placeholder="이메일">
  					<p class="my-auto"> @ </p>
  					<input type="text" class="email ml-3 " name="email1" id="email1" maxlength="15" style="width: 180px;">
  					<select id="email2" name="email2" class="p-3">
  					 	<option value="직접입력" selected="selected">직접입력</option>
  					 	<option value="naver.com">naver.com</option>
  					 	<option value="daum.net">daum.net</option>
  					 	<option value="hotmail.com">hotmail.com</option>
  					 	<option value="nate.com">nate.com</option>
  					 </select>
  					</div>
				 	</li>
				 	<li class="list-group-item">
      				<input type="hidden" id="confmKey" name="confmKey" value="devU01TX0FVVEgyMDIwMDIxNzE4NTQwNDEwOTQ3MzA="  >
					
				 	<input class="addrinput" type="text" id="roadAddrPart1" name="address1" readonly style="width:420px" placeholder="도로명주소">
					<button type="button" class="btn btn-secondary" onclick="goPopup();">주소검색</button>
				 	<br>
				 	<input class="addrinput" type="text" id="roadAddrPart2" name="address2" style="width:40%" placeholder="상세주소"> -
				 	<input class="addrinput" type="text" id="addrDetail" name="address3" readonly>				
					<input class="addrinput" type="text" id="zipNo" name="zip" readonly style="width:90px" placeholder="우편번호">
				 	</li>
				</ul>
				</div>
				<button class="btn btn-secondary regbtn">확인</button>
		</form>
		</div>
	</div>
</body>
</html>
