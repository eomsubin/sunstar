<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	
	<!-- callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다. -->
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "XMKUF7HdU8r3IIu3tMzr",
				callbackUrl: "http://localhost:8080/controller/callback",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var uniqId = naverLogin.user.getId();
					var name = naverLogin.user.getName();
					var email = naverLogin.user.getEmail();
					var nickname = naverLogin.user.getNickName();
					var profileImage = naverLogin.user.getProfileImage();
					var gender = naverLogin.user.getGender();
					var birthday = naverLogin.user.getBirthday();			
					var age = naverLogin.user.getAge();
					
					if( name == undefined || name == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					 
					if( nickname == undefined || nickname == null) {
						alert("별명은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					 
					if( profileImage == undefined || profileImage == null) {
						alert("프로필사진은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					  
					if( gender == undefined || gender == null) {
						alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					if( birthday == undefined || birthday == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					if( age == undefined || age == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					var user = {};
					user["uniqId"] = uniqId;
					user["name"] = name;
					user["email"] = email;
					user["nickname"] = nickname;
					user["profileImage"] = profileImage;
					user["gender"] = gender;
					user["birthday"] = birthday;
					user["age"] = age;
					console.log(user);
					
					$.ajax({
						url : "loginNaver"
						//,data : {"uniqId" : uniqId, "name" : name, "email" : email, "nickname" : nickname, "profileImage" : profileImage, "gender" : gender, "birthday" : birthday, "age" : age}
						,data : JSON.stringify(user)
						,type: "post"
						,success : function(data){
							console.log(data);
						}
						,error : function(e){
							console.log(e);
						}
					})
					console.log(naverLogin.user);
					console.log(naverLogin);
					/* window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/controller/"); */
				} else {
					console.log("callback 처리에 실패하였습니다.");
					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/controller/main/login");
				}
			});
		});
	</script>
</body>
</html>
