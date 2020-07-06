<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$('#btnJoinGoogle').click();
		});
	</script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="false" %>
	<a href="${google_url}">
		<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%; display: none;">
			<i class="fa fa-google" aria-hidden="true"></i>
		</button>
	</a>

</body>
</html>