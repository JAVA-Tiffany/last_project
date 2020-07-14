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
.form-group {
   width: 90%;
   margin: 10px auto;
   display: flex;
   justify-content: center;
   align-items: center;
}
</style>
</head>
<body>

<jsp:include page="../default/header.jsp"/>
<%-- <%@include file="header.jsp"%> --%>
<br>

<div align="center" class="div1">
   <table>
      <caption><font style="font: 400 30px 'Poppins',sans-serif;">Notice<br></font></caption>
         <tr>
            <th style="width: 10%;">번호</th>
            <th style="width: 50%;">제목</th>
            <th style="width: 10%;">작성자</th>
            <th style="width: 10%;">작성일</th>
            <th style="width: 10%;">조회수</th>
         </tr>
      <c:forEach var="adminList" items="${adminList}">
      <tr>
         <td><img src="https://attrangs.co.kr/asset/img/board/icon_notice.png"></td>
         <td>
         <a class="title" href="noticeview?bno=${adminList.bno}">
         ${adminList.title }</a></td>
         <td>관리자</td>
         <td style="font-size: 2px;">${adminList.regdate }</td>
         <td>${adminList.viewcnt }</td>
      </tr>
      </c:forEach>
       <c:forEach var="dto" items="${listAll}">
      <tr>
         
         <td>${dto.bno }</td>
         <td>
         <a class="title" href="noticeview?bno=${dto.bno}">
         ${dto.title }</a></td>
         <td>관리자</td>
         <td style="font-size: 2px;">${dto.regdate }</td>
         <td>${dto.viewcnt }</td>
      </tr>
      </c:forEach>
   </table>

      <!-- 검색 form -->
      <div id="acsearch" class="div2">
         <!-- search{s} -->
         <div class="form-group row justify-content-center"
            style="padding-bottom: 20px;">
            <div class="w100" style="padding-right: 10px">
               <select class="form-control form-control-sm" name="searchType"
                  id="searchType">
                  <option value="title">제목</option>
                  <option value="Content">본문</option>
                  <option value="reg_id">작성자</option>
               </select>
            </div>
            <div class="w300" style="padding-right: 10px">
               <input type="text" class="form-control form-control-sm"
                  name="keyword" id="keyword">
            </div>
            <div>
               <button type="button" class="btn btn-sm btn-primary"
                  name="btnSearch" id="btnSearch" onclick="title_search()">검색</button>
            </div>
         </div>
         <!-- search{e} -->
      </div>
      </div>
      <jsp:include page="../default/footer.jsp"/>
<%-- <%@include file="footer.jsp"%> --%>
</body>
</html>>