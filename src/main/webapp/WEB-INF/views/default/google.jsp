<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function () {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.disconnect();
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