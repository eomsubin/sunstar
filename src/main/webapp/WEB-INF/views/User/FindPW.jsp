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
			if(idcheck() && emailcheck() && Cnumckeck()){
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
					url : "${pageContext.request.contextPath}/registercustomer/customeridcheck/"+id
					,dataType : "json"
					,async: false
					,success:function(data){
						console.log(data);
						result = data;
					}
					,error:function(e){
						console.log(e);
					}
				});
				if(result>0){
					return true;
				}else{
					$('#id').parent().append("<p class='alert idalert p-0 m-0'>아이디를 다시 확인해주세요.</p>");
					return false;
				}
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
			let id = $('#id').val();
			if(!Emreg.test(email)){
				$('.emailalert').remove();
				$('#email2').addClass("telck");
				$('#email').parent().append("<p class='alert emailalert p-0 my-2 ml-3'>이메일 주소를 다시 확인해주세요.</p>");
				return false;
			}else{
				var emresult = 0;
				$('.emailalert').remove();
				$.ajax({
					url : "${pageContext.request.contextPath}/registercustomer/customeremailcheck"
					,data : {"email" : email, "id" : id}
					,dataType : "json"
					,async: false
					,success:function(data){
						console.log(data);
						emresult = data;
					}
					,error:function(e){
						console.log(e);
						return false;
					}
				});
				if(emresult>0){					
					$('#email2').removeClass("telck");
					$('.emailalert').remove();
					return true;
				}else{
					$('#email').parent().append("<p class='alert emailalert p-0 my-2 ml-3'>아이디에 유효하지 않는 이메일 주소 입니다.</p>");
					return false;
				}
			}
		}
		
		
		let result="0";
		let Certification="0";
		// 인증번호 확인
		function Cnumckeck(){
			if(result=="0")
				{
				alert("인증번호를 발급받으세요.");
				return false;
			}else if(result==$('#cknum').val()){
				return true;
			}else{
				$('.uncknumalert').remove();
				$('#cknum').parent().append("<p class='alert uncknumalert p-0 my-2 ml-3'>인증번호를 정확히 입력해주세요.</p>");
				return false
			}
			return false;
		}
		// 인증번호 발급
		$('.getCertificationNum').click(function(){
			if(idcheck() && emailcheck()){
			var email = $('#email').val();
			email += "@";
			email += $('#email1').val();
			var id = $('#id').val();
			$.ajax({
				url : "getCertificationPWNum"
				,data : {"email" : email, "id" : id}
				,dataType : "json"
				,async: false
				,success:function(data){
				console.log(data);
					result = data;
					alert("인증번호 발송 요청이 완료되었습니다. 인증번호가 오지 않는 경우, 입력한 이름/이메일주소 확인 후 다시 요청해주세요.");
					setTimer();
					clearInterval(Interval);
					Interval = setInterval(Timer,1000);
				}
				,error:function(e){
					console.log(e);
					return false;
				}
				});
				//end ajax;
			}
		})
		//end 인증번호 발급
		//타이머
		let Interval;
		let min;
		let sec;
		function setTimer(){
			min=9;
			sec=59;
			$('.uncknumalert').remove();
		};
		function Timer(){
			$('.cknumalert').remove();
			$('#cknum').parent().append("<p class='alert cknumalert p-0 my-2 ml-3'>인증번호 입력해주세요. "+min+"분 "+sec--+"초 남았습니다.</p>");
			if(sec<1)
				{
				min--;
				sec=59;
			}
			if(min<0){
				$('.cknumalert').remove();
				$('#cknum').parent().append("<p class='alert cknumalert p-0 my-2 ml-3'>인증번호를 다시 요청해주세요.</p>");
				clearInterval(Interval);
				result="0";
			}		
		}
		//end 타이머
	});
</script>
</head>
<body>
<div class="mx-auto mt-5 row align-items-bottom" style="width: 600px; height: 138px;">
<div class="col">
		<h1 class="regh1">비밀번호 찾기</h1><span class="regspan now">이메일로 찾기</span>
		<p class="txt_info">회원정보를 입력해주세요. 모두 입력하셔야 찾기가 가능합니다.</p>
		</div>
		</div>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col">
		<form method="post" action="${pageContext.request.contextPath}/userlogin/FindPW/FindPwComplete">
				<div class="reg_formbox py-0">
				<ul class="list-group">
				  	<li class="list-group-item"><input style="width: 450px;" type="text" name="id" id="id" placeholder="아이디" maxlength="10"></li>			
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
