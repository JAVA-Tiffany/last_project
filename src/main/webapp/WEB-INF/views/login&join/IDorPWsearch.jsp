<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
   href="resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
   href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
   href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script type="text/javascript"
   src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
      $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
   })
</script>
<script type="text/javascript">
   var n="";
   var e="";
   var u="";
   function eamil_k(t) {
       if(t=='id'){
          a='id';
          n=$("#name_text").val();
          e=$("#email_id").val();
          u="idsearch";
       }else{
          a='pw';
          n=$("#id_text").val();
          e=$("#email_pw").val();
          u="pwsearch";
       }
       $.ajax({
            url : u,
            type : "POST",
            data : {name:n,mail:e},
            success : function(data) {
               $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
               if(t=='id'){
                  if(data!=''){
                     $("#result_id").val(data);
                     main_ch(t);
                  }else{
                     alert("일치하는 회원 정보가 없습니다.")
                  }
               }else{
                  if(data==''){
                     alert("일치하는 회원 정보가 없습니다.")
                  }else{
                     $("#result_id").val(data);
                     main_ch(t);
                  }
               }
         },
            error : function() {
               $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
               alert('확인 실패')
            }
         });
   }
   function main_ch(t) {
      if($("#email_btn_"+t).val()=="인증 발급"){
         $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
         $.ajax({
            url : "mailSending",
                type : "POST",
                data : {email:e,ch:'인증'},
                success : function(data) {
                   $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
                   alert("인증번호 보내졌습니다.")
                    $("#result").val(data);
                    $("#email_btn_"+t).val("인증 확인");
                },
                error : function() {
                   $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
                    alert('보내기 실패')
                }
         });
      }else if($("#email_btn_"+t).val()=="인증 확인"){
         if($("#join_email_key_"+t).val()==$("#result").val()){
            alert("인증 완료")
               $("#email_btn_"+t).val("인증 메일 수정");
               $("#result_page").css("display","block");
               $("#id_page").css("display","none");
               $("#pw_page").css("display","none");
               if(t=="pw"){
                  alert("이메일로 임시 비밀 번호를 보내겠습니다.\n확인 누르면 보내집니다.")
                  $.ajax({
                   url : "mailSending",
                       type : "POST",
                       data : {email:e,ch:'비번',id:n},
                       success : function(data) {
                          alert("임시 비밀 번호 보내졌습니다.")
                       },
                       error : function() {
                           alert('보내기 실패')
                       }
                });
               }
           }else{
               alert("인증 실패")
               $("#email_btn_"+t).val("인증 발급");
           }
        }
   }
   </script>
<script type="text/javascript">
   function id_page() {
      $("#id_page").css("display","block");
      $("#pw_page").css("display","none");
      $("#result_page").css("display","none");
   }
      function pw_page() {
        $("#id_page").css("display","none");
        $("#pw_page").css("display","block");
        $("#result_page").css("display","none");
   }
   </script>
<style type="text/css">
.input1001 {
   font-family: Poppins-Medium;
   font-size: 15px;
   line-height: 1.5;
   color: #666666;
   display: block;
   width: 150px;
   background: #e6e6e6;
   height: 50px;
   border-radius: 25px;
   padding: 0 30px 0 30px;
   outline: none;
   border: none;
   text-align: center;
}
#Progress_Loading
{
 position: absolute;
 left: 40%;
 top:10px;
 background: none;
 width: 200px;
 height: 200px;
}
</style>
</head>
<body>
   <div id = "Progress_Loading"><!-- 로딩바 -->
      <img style="width: 200px; height: 200px;" src="resources/img/Progress_Loading.gif"/>
   </div>

   
   <div class="limiter">
      <div class="container-login100" style="flex-direction: column;">
         <div class="wrap-login100">
            <span class="login100-form-title"
               style="display: flex; flex: row; margin-bottom: 20px;">
               <button class="login100-form-btn-facebook" onclick="id_page()"
                  style="background-color: #9ad8dc">아이디찾기</button>
               <button class="login100-form-btn-facebook" onclick="pw_page()"
                  style="background-color: #9ad8dc">비밀번호찾기</button>
            </span>
            <div id="id_page">
               <form class="login100-form validate-form" action="loginchk"
                  id="cInput">
                  <div class="wrap-input100 validate-input"
                     data-validate="id is required">
                     <input class="input100" type="text" name="id"
                        placeholder="이름 입력하세요" id="name_text"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                     </span>
                  </div>

                  <div class="wrap-input100 validate-input"
                     data-validate="id is required">
                     <input class="input100" type="text" name="pw"
                        placeholder="이메일 입력하세요" id="email_id"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div style="display: flex; flex: row;">
                     <div class="wrap-input100 validate-input"
                        style="width: 200px; margin-right: 20px;">
                        <input type="text" placeholder="인증번호" class="input100"
                           id="join_email_key_id" name="join_email_key"> <span
                           class="focus-input100"></span> <span class="symbol-input100">
                           <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                     </div>
                     <div align="center">
                        <input type="button" id="email_btn_id" value="인증 발급"
                           class="input1001" onclick="eamil_k('id')"
                           onmouseover="style='cursor:pointer;'">
                     </div>
                  </div>
                  <div class="container-login100-form-btn">
                     <button class="login100-form-btn-login"
                        onclick="location.href='index'">취소</button>
                  </div>
               </form>
            </div>
            <div id="pw_page" style="display: none;">
               <form class="login100-form validate-form" action="loginchk"
                  id="cInput">
                  <div class="wrap-input100 validate-input"
                     data-validate="id is required">
                     <input class="input100" type="text" name="id"
                        placeholder="아이디 입력하세요" id="id_text"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                     </span>
                  </div>

                  <div class="wrap-input100 validate-input"
                     data-validate="id is required">
                     <input class="input100" type="text" name="pw"
                        placeholder="이메일 입력하세요" id="email_pw"> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                     </span>
                  </div>
                  <div style="display: flex; flex: row;">
                     <div class="wrap-input100 validate-input"
                        style="width: 200px; margin-right: 20px;">
                        <input type="text" placeholder="인증번호" class="input100"
                           id="join_email_key_pw" name="join_email_key"> <span
                           class="focus-input100"></span> <span class="symbol-input100">
                           <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                     </div>
                     <div align="center">
                        <input type="button" id="email_btn_pw" value="인증 발급"
                           class="input1001" onclick="eamil_k('pw')"
                           onmouseover="style='cursor:pointer;'">
                     </div>
                  </div>
                  <div class="container-login100-form-btn">
                     <button class="login100-form-btn-login"
                        onclick="location.href='login'">로그인 이동</button>
                  </div>
               </form>
            </div>
            <div id="result_page"
               style="width: 350px; height: 180px; display: none" align="center">
               <input type="text" id="result_id" disabled="disabled">
               <div class="container-login100-form-btn">
                     <button class="login100-form-btn-login"
                        onclick="location.href='login'">로그인 이동</button>
                  </div>
            </div>
         </div>
         <div align="center" style="margin-top: 20px;">
            <h5>
               <font color="red" size="3px"> 본인확인 이메일 주소와 입력한 이메일 주소가 같아야,
                  인증번호를 받을 수 있습니다.<br> 대소문자 구분, 인증번호 보내기가 완료 되면 "인증번호 보내졌습니다."
                  알람이 뜹니다.<br> 하지만 알람창 띄웠는데 만약 메일이 MAKE 인증번호가 안오면 입력하신 메일
                  확인 해주세요
               </font>
            </h5>
         </div>
      </div>
   </div>



   <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
   <script src="resources/vendor/bootstrap/js/popper.js"></script>
   <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="resources/vendor/select2/select2.min.js"></script>
   <script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
   <script>
      $('.js-tilt').tilt({
         scale: 1.1
      })
   </script>
   <script src="resources/js/main.js"></script>

   <input type="hidden" id="result">
   <form action="pwinfo" method="post" name="pwform">
      <input type="hidden" id="pwform_text" name="pwform_text">
   </form>
</body>
</html>