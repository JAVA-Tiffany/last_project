<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/css/main.css?after"> -->
</head>
<body>
<c:if test="${sessionScope.id ne 'admin' }">
<script type="text/javascript">
	alert("관리자만 접근가능합니다")
	location.href="index"
</script>
</c:if>
관리자 페이지 입니다.<br>
재고관리, 계정 조회, 계정 삭제, 게시물 관리, 구매관리,


<div align="center">
<button type="button" onclick="location.href ='acsearch'" style="width:100px;height:70px;">계정 관리</button><br><br>
<button type="button" onclick="location.href ='QuantityManage'" style="width:100px;height:70px;">재고관리</button><br><br>
<button type="button" onclick="location.href ='acboard'" style="width:100px;height:70px;">게시물 관리</button><br><br>
<button type="button" onclick="location.href ='acnotice'" style="width:100px;height:70px;">공지사항</button><br><br>
<button type="button" style="width:100px;height:70px;">구매관리</button><br><br>


</div>



 
</body>
</html>