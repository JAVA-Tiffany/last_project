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
$(document).ready(function() {

   // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
   var floatPosition = parseInt($("#floatMenu").css('top'));
   // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

   $(window).scroll(function() {
      // 현재 스크롤 위치를 가져온다.
      var scrollTop = $(window).scrollTop();
      var newPosition = scrollTop + floatPosition + "px";

      /* 애니메이션 없이 바로 따라감
       $("#floatMenu").css('top', newPosition);
       */

      $("#floatMenu").stop().animate({
         "top" : newPosition
      }, 500);

   }).scroll();

});

// function title_search() {
    
//     alert($("#searchType").val());
//     //타입 입력
//     $("#type_result").val($("#searchType").val());
    
//     if($("#searchType").val()=="title"){
//        $("#search_result").val($("#keyword").val());
//        alert($("#search_result").val());
//        list_form.submit();
//     }else if($("#searchType").val()=="Content"){
//        $("#search_result").val($("#keyword").val());
//        alert($("#search_result").val());
//        list_form.submit();
//     }else{
//        $("#search_result").val($("#keyword").val());
//        alert($("#search_result").val());
//        list_form.submit();
//     }
//  }

</script>
<style type="text/css">
#floatMenu {
   position: absolute;
   width: 200px;
   height: 200px;
   left: 50px;
   top: 10px;
   background-color: #606060;
   color: #fff;
}
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
<div id="floatMenu">
플로팅 메뉴
</div>
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

       <c:forEach var="dto" items="${listAll}">
      <tr>
         
         <td>${dto.bno }</td>
         <td>
         <a class="title" href="noticeview?bno=${dto.bno}">
         ${dto.title }</a></td>
         <td>${dto.writer }</td>
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
</html>