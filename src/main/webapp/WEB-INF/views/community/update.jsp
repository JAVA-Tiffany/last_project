<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
// $(document).ready(function(){
// 	$("btnDelete").click(function(){
// 		document.form1.action = "delete";
// 		document.form1.submit();
// 	})
// })

</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
.div2 {
 padding-top: 20px;
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
<div align="center" class="div1">
<form method="post" action="update_save?bno=${view.bno}">
<input type="hidden" value="${view.bno}" name="bno">
   <table class="board_view">
   		
        <caption>글 수정</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
          <tbody>
            <tr>
                <th>제목</th>
                <td>
                <input type="text" name="title" id="title" size="80" value="${view.title}" placeholder="제목을 입력하세요.">
                </td>
                <th>조회수</th>
                <td>${view.viewcnt }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${view.writer }</td>
                <th>작성시간</th>
                <td>${view.regdate }</td>
            </tr>
            <tr style="height:300px;">
                <th>내용</th>
                <td colspan="3">
                	<input type="text" name="content" id="content" style="height:200px;
                	 width: 700px;" value="${view.content}" placeholder="내용을 입력해주세요.">
   
                </td>
            </tr>
        </tbody>
    </table>
    <div class="div2">
    <a href="list" id="list" class="btn">목록으로</a>
    <input type="submit" value="완료">
<%--     <a href="update?bno=${view.bno}" class="btn">수정하기</a>  --%>
	</div>
    </form>
 </div>       

<jsp:include page="../default/footer.jsp"/>
</body>
</html>