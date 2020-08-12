<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${num eq 1 }">
		<script type="text/javascript">
		alert("로그인 실패");
		location.href="login"
		</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
	alert("이미 존재하는 회원입니다.회원가입 페이지로 이동합니다");
	history.back();
</script>
	</c:otherwise>
</c:choose>


</body>
</html>