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
}
.div2{
padding-top: 40px;
}
body {
font: 400 15px 'Poppins',sans-serif;
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

<script src="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
      var size= ${listAll.size()}
      
      if(size>10){
          $(function (){
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><<</a></div> ");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><</a></div> ");
             for(i=0;i<size/9;i++){
                $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' onclick='number_click("+(i+1)+")' style='text-decoration: none;' id='a"+(i+1)+"'>"+(i+1)+"</a></div>");
             };
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>></a></div> ");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>>></a></div>");
          });
       }else{
          $(function (){
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><<</a></div> ");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><</a></div> ");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>1</a></div>");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>></a></div> ");
             $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>>></a></div>");
          });
       }
      
	function totle_click(d) {
		console.log(d);
		$("#bno_result").val(d);
		bno_form.submit();
	}
</script>
<jsp:include page="../default/header.jsp"/>
<%-- <%@include file="header.jsp"%> --%>

<div align="center" class="div1">
   <table border="0">
      <caption><font style="font: 400 30px 'Poppins',sans-serif;">Q/A<br></font></caption>
         <tr>
            <th style="width: 10%;">번호</th>
            <th style="width: 50%;">제목</th>
            <th style="width: 10%;">작성자</th>
            <th style="width: 10%;">작성일</th>
            <th style="width: 10%;">조회수</th>
         </tr>

      <c:forEach var="dto" items="${listAll}">
      <tr>
         <td>${dto.bno }</td>
         <td onclick="totle_click(${dto.bno})"><label> ${dto.title} </label> </td>
         <td>${dto.writer }</td>
         <td style="font-size: 2px;">${dto.regdate}</td>
         <td>${dto.viewcnt }</td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5" style="text-align: center;">
            <a href="write">글작성</a>
         </td>
      </tr>
   </table>


	<!-- 검색 form -->
	<div id="search" class="div2">
      <!-- search{s} -->
      <div class="form-group row justify-content-center">
         <div class="w100" style="padding-right:10px">
            <select class="form-control form-control-sm" name="searchType" id="searchType">
               <option value="title">제목</option>
               <option value="Content">본문</option>
               <option value="reg_id">작성자</option>
            </select>
         </div>
         <div class="w300" style="padding-right:10px">
            <input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
         </div>
         <div>
            <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
         </div>
      </div>
      <!-- search{e} -->
	</div>
    <div align="center" >
   <div id="num" style="display: flex; flex-flow: low; width: 600px;">
   </div></div>

<jsp:include page="../default/footer.jsp"/>
<%-- <%@include file="footer.jsp"%> --%>
	<form action="view" name="bno_form" method="post">
		<input type="hidden" name="bno" id="bno_result">
	</form>
</body>
</html>