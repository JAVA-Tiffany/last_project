<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div1 {
padding-top: 100px;
padding-bottom: 100px;

}
.div1 a:hover {
color:red; background-color: black;
}

body {
   font: 400 14px 'Poppins',sans-serif;
}


a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
   color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color:red; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->


</style>
<!-- <link rel="stylesheet" type="text/css" -->
<!--    href="resources/css/main.css?after"> -->
</head>
<body>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:if test="${sessionScope.id.split('_')[0] ne 'admin' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
</c:if>

<!-- <div align="center"> -->
<!-- <button type="button" onclick="location.href ='acsearch'" style="width:100px;height:70px;">계정 관리</button><br><br> -->
<!-- <button type="button" onclick="location.href ='QuantityManage'" style="width:100px;height:70px;">재고관리</button><br><br> -->
<!-- <button type="button" onclick="location.href ='acboard'" style="width:100px;height:70px;">게시물 관리</button><br><br> -->
<!-- <button type="button" onclick="location.href ='acnotice'" style="width:100px;height:70px;">공지사항</button><br><br> -->
<!-- <button type="button" style="width:100px;height:70px;">구매관리</button><br><br> -->
<jsp:include page="AdminHeader.jsp"/>


<div class="div2" style="padding-top: 100px; text-align: center;" >

<font size="10" color="#007bff" style="font-family: 나눔바른고딕;">관리자 페이지입니다. :)</font>
</div>




 <jsp:include page="../default/footer.jsp"/>
</body>
</html>