<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<style>
.custom-control-input:checked~.custom-control-label::before {
    color: #fff;
    border-color: #fbab60;
    background-color: #fbab60;
}

.FindIDbtn{
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

.FindIDbtn { 
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
		
		//email select change
		$('#email2').change(function(){
			let str = "";
			str += $('#email2 option:selected').text();
			if(str==="직접입력"){
			$('#email1').val("");
			}else{
			$('#email1').val(str);
			}
		})
		$('.FindIDbtn').click(function(){
			event.preventDefault();
			if(namecheck() && emailcheck() && Cnumckeck()){
				$('form').submit();
			}
		})		
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
					$('.emailalert').remove();
					$('#email2').removeClass("telck");
					return true;
			}
		}
		
		// 인증번호 확인
		function Cnumckeck(){
			if(result=="0" || Certification=="")
				{
				
				}
			return false;
		}
		let result="0";
		let Certification="";
		// 인증번호 발급
		$('.getCertificationNum').click(function(){
			if(namecheck() && emailcheck()){
			var email = $('#email').val();
			email += "@";
			email += $('#email1').val();
			var name = $('#name').val();
			$.ajax({
				url : "getCertificationNum"
				,data : {"email" : email, "name" : name}
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
				//end ajax;
			}
		})
	
	});
</script>
</head>
<body>
<div class="mx-auto mt-5 row align-items-bottom" style="width: 600px; height: 138px;">
<div class="col">
		<h1 class="regh1">아이디 찾기</h1><span class="regspan now">이메일로 찾기</span>
		<p class="txt_info">회원정보를 입력해주세요. 모두 입력하셔야 찾기가 가능합니다.</p>
		</div>
		</div>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col">
		<form method="post" action="${pageContext.request.contextPath}/registercustomer/insertcustomer">
				<div class="reg_formbox py-0">
				<ul class="list-group">
				  	<li class="list-group-item"><input style="width: 450px;" type="text" name="name" id="name" placeholder="이름" maxlength="10"></li>			
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
				 	<input style="width: 380px;" type="text" name="cknum" id="cknum" placeholder="인증번호" maxlength="6">
				 	<button type="button" class="btn btn-secondary getCertificationNum">인증번호 받기</button>
				 	</li>
				</ul>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="btn btn-secondary FindIDbtn">확인</button>
		</form>
		</div>
	</div>
</body>
</html>
