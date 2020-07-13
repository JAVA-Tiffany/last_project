IDorPWsearch.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="resources/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      function number_in(t) {
         
         var n="";
         var e="";
         var u="";
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
         $("#id_btn").attr("disabled","disabled");
         $("#pw_btn").attr("disabled","disabled");
         $.ajax({
              url : u,
              type : "POST",
              data : {name:n,mail:e},
              success : function(data) {
                 if(t=='id'){
                    if(data!=''){
                       $("#result_id").val(data);
                       main_ch(t);
                    }else{
                       alert("인증 확인 완료\n해당 하는 ID가 없습니다.")
                       $("#id_btn").val("인증번호 받기");
                    }
                 }else{
                    if(data==''){
                       alert("일치하는 회원 정보가 없습니다.")
                       $("#id_btn").val("인증번호 받기");
                    }else{
                       main_ch(t);
                    }
                 }
              },
              error : function() {
                 alert('확인 실패')
              }
         })
         $("#id_btn").removeAttr("disabled");
             $("#pw_btn").removeAttr("disabled");
         $("#pw_ch").attr("disabled","disabled");
         $("#id_ch").attr("disabled","disabled");
      }
      function main_ch(t) {
         var z;
         if(t=='id'){
            $("#id_btn").val("인증번호 받는중");
            z=$("#email_id").val();
         }else{
            $("#pw_btn").val("인증번호 받는중");
            z=$("#email_pw").val();
         }
         $.ajax({
              url : "mailSending",
              type : "POST",
              data : {email:z},
              success : function(data) {
                 alert("인증번호 보내졌습니다.")
                 $("#result").val(data);
                 if(t=='id'){
                    $("#id_ch").removeAttr("disabled");
                    $("#id_btn").val("인증번호 받기");
                 }else{
                    $("#pw_ch").removeAttr("disabled");
                    $("#pw_btn").val("인증번호 받기");
                 }
              },
              error : function() {
                 alert('보내기 실패')
              }
         })
      }
      function number_ch(t) {
         var a="";
         if(t=='id'){
            a='id';
         }else{
            a='pw';
         }
         if($("#result").val()==$("#num_"+a).val()){
            if(t=='id'){
               alert("확인 완료\n"+$("#result_id").val());
            }else{
               alert("확인 완료\n"+"회원 정보 수정 페이지로 이동합니다.")
                 $("#pwform_text").val($("#id_text").val());
                 pwform.submit();
            }
         }
         $("#id_btn").removeAttr("disabled");
             $("#pw_btn").removeAttr("disabled");
         $("#pw_ch").attr("disabled","disabled");
         $("#id_ch").attr("disabled","disabled");
      }
      
   </script>
</head>
<body>
   <div align="center">
      <h3 style="border-bottom: 1px solid black; width: 500px; margin-top: 100px;">아이디 찾기</h3>
   </div>
   <div align="center">
      <div style="display: flex; flex: row; width: 400px; margin-bottom: 5px;">
         <div style="width: 100px; text-align: center;" >이름</div>
         <input type="text" name="name_text" id="name_text">
      </div>
      <div style="display: flex; flex: row; width: 400px; margin-bottom: 5px;">
         <div style="width: 100px; text-align: center;">이메일 주소</div>
         <input type="email" id="email_id" name="email_id">
         <input type="button" value="인증번호 받기" style="margin-left: 5px;"  onclick="number_in('id')" id="id_btn">
      </div>
      <div style="width: 400px; margin-bottom: 5px;" align="left">
         <input type="text" id="num_id" name="num_id" style="margin-left: 100px" placeholder="인증번호 8자리 숫자 입력">
         <input type="button" value="인증번호 확인" onclick="number_ch('id')" disabled="disabled" id="id_ch">
      </div>
   </div>
   
   <div align="center">
      <h3 style="border-bottom: 1px solid black; width: 500px; margin-top: 100px;">비밀번호 찾기</h3>
      
   </div>
   <div align="center">
      <div style="display: flex; flex: row; width: 400px; margin-bottom: 5px;">
         <div style="width: 100px; text-align: center;">아이디</div>
         <input type="text" name="id_text" id="id_text">
      </div>
      <div style="display: flex; flex: row; width: 400px; margin-bottom: 5px;">
         <div style="width: 100px; text-align: center;">이메일 주소</div>
         <input type="email" id="email_pw" name="email_pw">
         <input type="button" value="인증번호 받기" style="margin-left: 5px;" onclick="number_in('pw')" id="pw_btn">
      </div>
      <div style="width: 400px; margin-bottom: 5px;" align="left">
         <input type="text" id="num_pw" name="num_pw" style="margin-left: 100px" placeholder="인증번호 8자리 숫자 입력">
         <input type="button" value="인증번호 확인" onclick="number_ch('pw')" disabled="disabled" id="pw_ch">
      </div>
   </div>
   <div align="center" style="margin-top: 100px;">
      <h5>
         <font color="red" size="3px"> 본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
         대소문자 구분, 인증번호 보내기가 완료 되면 "인증번호 보내졌습니다." 알람이 뜹니다.<br>
         하지만 알람창 띄웠는데 만약 메일이 self design 인증번호가 안오면 입력하신 메일 확인 해주세요</font>
      </h5>
   </div>
   
   <input type="hidden" id="result">
   <input type="hidden" id="result_id">
   <form action="pwinfo" method="post" name="pwform">
      <input type="hidden" id="pwform_text" name="pwform_text">
   </form>
</body>
</html>