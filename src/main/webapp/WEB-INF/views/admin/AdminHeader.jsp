<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ad(d) {
	   $("form[name=adminHeader_form]").attr("action",d);
	   adminHeader_form.submit();
	}
</script>
<style type="text/css">
.div1 {
padding-top: 100px;
padding-bottom: 50px;

}
.div1 a:hover {
color:red; background-color: black;
}

body {
   font: 400 14px 'Poppins',sans-serif;
}
.img1 {
    margin-block-start: 0em; 
     margin-block-end: 0em;
}


a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
   color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color:red; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->
</style>

</head>
<body>
<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
   
</script>

</c:if>

  <div style="float: left;">
        
      <a href="index" style="color: black;">
            <img class="img1" src="resources/img/MAKE1.png" style="width:200px; height: 69PX; color:#F6F6F6;">
        </a>      
      
      &nbsp; &nbsp;
      <label><font color="#000000;" style="font-family: 윤고딕;" size="4">ADMINISTRATOR</font></label>&nbsp;
      <a href="index"><font color="blue" size="4" style="font-family: 나눔바른고딕;">홈페이지</font></a>
   </div>
   
   <div style="float: right;">
      User : <a href="myinfo"><font color="red" style="font-family: 나눔바른고딕;">${id}</font></a>님 환영합니다. &nbsp; &nbsp;
      <a href="adminpage"><font color="" size="4" style="font-family: 나눔바른고딕;">관리페이지</font></a> &nbsp; &nbsp;
      <a href="logout"><font color="blue" size="4" style="font-family: 나눔바른고딕;">로그아웃</font></a>
   </div>

<div align="center" class="div1">
<table style="width: 80%;" class="table">

   <tr style="background-color: #007bff; text-align: center; height: 50px;"  >
      
      
      <td><a href="javascript:ad('acsearch');"><font color="white" size="4">계정 관리</font></a></td>
      <td><a href="javascript:ad('QuantityManage');"><font color="white" size="4">재고관리</font></a></td>
      <td><a href="javascript:ad('acboard');"><font color="white" size="4">게시물 관리</font></a></td>
      <td><a href="javascript:ad('acnotice');"><font color="white" size="4">공지사항</font></a></td>
      <td><a href="javascript:ad('accart');"><font color="white" size="4">구매관리</font></a></td>
      <td><a href="adminpage"><font color="white" size="4">메인페이지</font></a></td>
   </tr>
</table>
</div>
<form name="adminHeader_form" method="post">
	<input type="hidden" id="adminHeader_form_start" name="start" value="1">
	<input type="hidden" id="adminHeader_form_end" name="end" value="10">
</form>
</body>
</html>