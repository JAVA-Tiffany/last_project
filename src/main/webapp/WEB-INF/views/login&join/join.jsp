
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/util.css?after">
<link rel="stylesheet" type="text/css" href="resources/css/main.css?after">
<script type="text/javascript" src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<iframe src="http://nid.naver.com/nidlogin.logout" style="visibility:hidden;display:none"></iframe>
<script type="text/javascript">
function deltoken(){
	$.ajax({
		url:"deltoken",
		type:"GET",
	success: function(){
		location.href="nid.naver.com/oauth2.0/token?grant_type=delete&client_id=Kw8vD_2MRNtNf4TERrlM&client_secret=nfGVNN_nu7&access_token="
			+ "AAAAN_LCbVdhtfBQxzlMnQ2eqTVupLkpDvSCH4p7AzX6pOEu8Km7G0722fmlWmrn9haz_6BRsm_4X_DNGYoadZNOO7k&service_provider=NAVER";
		
	},error: function(){
		alert("문제가 발생했습니다")
	}
	})
}
function pagereturn(){
	
	$.each(list,function(index,item){
		
	})
	
	$("#").html(html)
	
}

</script>


	<script type="text/javascript">
		function ch() {
			if (document.getElementById("id").value == "") {
				alert("아이디 칸이 비어있습니다.")
			}
		}
		function pwlengthch() {
			var r = 0
			var r1 = 0
			if (document.getElementById("pw").value.length < 8) {
				document.getElementById("pw1").innerHTML = "비밀번호는 8자리 이상입니다."
				document.getElementById("pw").value=""
			} else {
				cut = document.getElementById("pw").value.split("")
				for (i = 0; i < cut.length; i++) {
					if (('A' <= cut[i] && cut[i] <= 'Z') || ('a' <= cut[i] && cut[i] <= 'z')) {
						r = 1
					}
					if (('!' <= cut[i] && cut[i] <= '/') || (':' <= cut[i] && cut[i] <= '@')
							|| ('[' <= cut[i] && cut[i] <= '\'') || ('{' <= cut[i] && cut[i] <= '~')) {
						r1 = 1
					}
				}
				if (r == 1 && r1 == 1) {
					document.getElementById("pw1").innerHTML = "비밀번호 사용 가능합니다."
					document.getElementById("pw1").style.color = "black"
				}else{
					document.getElementById("pw1").innerHTML = "영어 또는 특수문자를 넣어 주세요"
					document.getElementById("pw1").style.color = "red"
					document.getElementById("pw").value=""
				}
			}
		}
	
		function pwch() {
			if (document.getElementById("pw").value != document.getElementById("pwc").value) {
				alert("비밀번호가 맞지 않습니다.")
				document.getElementById("pw").value=""
				document.getElementById("pwc").value=""
			}
		}
		
		function al() {
			if (document.getElementById("id").value == "" || document.getElementById("pw").value == ""
					||document.getElementById("pwc").value == "" || document.getElementById("name").value == "" ||
					document.getElementById("addr").value == "" || document.getElementById("phon").value == "") {
				alert("비어있는 칸이 존재합니다.")
			} else {
				alert("회원가입이 정상적으로 완료되었습니다!")
				user.submit()
				opener.parent.location.reload();
			}
		}
		$(function () {
			a = '${NaverDto.id}';
			a = '${GoogleId}';
			$("#id").val(a);
		});
		
	</script>
<!-- 	회원가입 -->

<div class="limiter">
		<div class="container-login100" align="center">
			<div class="wrap-login100" align="center">
			<h2>Self Design 계정 만들기</h2><br>
<!-- 			<div class="login100-pic js-tilt" data-tilt> -->
<!-- 				<img src="resources/images/80678738_2416624028588147_5452304186879982403_n.jpg" alt="IMG"> -->
<!-- 			</div> -->
				<div align="center">
					
					<form action="joinok" name="user" style="align:center;">
		
					<div class="wrap-input100 validate-input" align="center">
						<input type="text" id="id" placeholder="아이디" class=input100 name="id">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"  style="text-align:right;"></i>
						</span>
					</div>
					
						
					<div class="wrap-input100 validate-input">
						<input type="text" id="pw" placeholder="비밀번호" class="input100" onchange="pwlengthch()" name="pw">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input type="text" id="pwc" placeholder="비밀번호 확인" class="input100"  onchange="pwch()">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input type="text" id="name" placeholder="이름" class="input100" name="name" value="${NaverDto.name }">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input type="text" id="addr" placeholder="주소" class="input100" name="addr">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input type="text" id="phon" placeholder="핸드폰번호 xxx-xxxx-xxxx" class="input100" name="phon">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="container-login100-form-btn">
				<input type="button" class="login100-form-btn-login" onclick="al()" value="회원가입">
			</div>
			
			<label style="margin-right: 95px;" id="pw1"></label><br>
			<label style="margin-right: 95px;" id="pwc2"></label><br>
			
			
			
		</form>
	</div>
		
	</div>
	</div>
	</div>
	
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/select2/select2.min.js"></script>
	<script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="resources/js/main.js"></script>
	
</body>
</html>
