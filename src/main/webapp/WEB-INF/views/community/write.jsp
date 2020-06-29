<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
  table {
    width: 60%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
	color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color: #000; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->
 fieldset {
    border: none;
    vertical-align: top;
}
</style>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div class="div1">
	<form action="save_write">
	<div>
		제목 : 
		<input name="title" id="title" size="50" placeholder="제목을 입력하세요.">
	</div>
	<div>
		내용 :
		<textarea name="content" id="content" rows="5" cols="100" placeholder="내용을 입력하세요."></textarea>
	</div>
	<div>
		이름 :
		<input name="writer" id="writer" placeholder="이름을 입력하세요." >
	</div>
	<div>
		<button type="submit">확인</button>
	</div>
	</form>
</div>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>