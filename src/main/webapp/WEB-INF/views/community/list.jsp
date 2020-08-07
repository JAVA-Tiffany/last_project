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
.div0 {
   padding-top: 180px;
   justify-content: center;
   align-items: center;
   text-align: center;
   color: rgb(85, 85, 85);
}
.h22{
   margin: 0 auto;
    padding: 0 0 5px 0px;
    color: #2e2e2e;
    font: 400 14px 'Poppins',sans-serif;
    letter-spacing: 1.9px;
    border-bottom: 3px double #E2E3E4;
    width: 350px;
    font-size: 18px;
}

.div1 {
padding-top: 50px;
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
.form-group {
   width: 90%;
   margin: 10px auto;
   display: flex;
   justify-content: center;
   align-items: center;
}
.texttt{
   width:280px;
   height: 30px;
    line-height: 20px;
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
    font-size: 12px;
}
.ooop{
   margin: 0 2px 0 0;
    width: 90px;
    height: 30px;
    border: 1px solid #d5d5d5;
   font-size: 100%;
    color: #353535;
    vertical-align: middle;
    font-family: "돋움",Dotum;
}
.aa{
   background: #ffffff;
    color: #464646;
    font-size: 12px;
    font-family: Noto Sans KR,sans-serif;
    border: 1px solid #c2c2c2;
    display: inline-block;
    margin-top: 3px;
    line-height: 14px;
    padding: 10px 25px 10px;
    text-decoration: none;
}
.se{
   margin: 0 2px 0 0;
    width: 92px;
    font-size: 100%;
    color: #353535;
    vertical-align: middle;
    font-family: "돋움",Dotum;
    height: 30px;
    border: 1px solid #d5d5d5;
}
.nnu{
   padding: 0;
   margin: 0;
   margin-left: 200px;
}
.replycount{
   color:red;
}
</style>
</head>
<body>

<script src="resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    
var size= ${list_size}
var ssize;
var zxc=1;
function number_click(age) {
     zxc=age;
     if($("#search_result_init").val()==""){
         $("#start"+age).val((parseInt(age)*10)-9);
         $("#last"+age).val(parseInt(age)*10);
         $("#numbtn"+age).trigger("click");
      }else{
         $("#search_result").val($("#search_result_init").val());
         $("#type_result").val($("#type_result_init").val());
         $("#start_result").val((parseInt(age)*10)-9);
         $("#end_result").val(parseInt(age)*10);
         list_form.submit();
      }
   
}
function number_onedown() {
    
    if('${Integer.valueOf(list_last/10)-1>1}')
    number_click('${Integer.valueOf(list_last/10)-1}');
}
function number_oneup() {
     var m;
     if('${list_size%10>0}'=='true'){
        m='${Integer.valueOf(list_size/10)+2}';
     }else{
        m='${Integer.valueOf(list_size/10+1)}';
     }
     if(parseInt('${Integer.valueOf(list_last/10)+1}')<parseInt(m))
     number_click('${Integer.valueOf(list_last/10)+1}');
}
function number_up() {
     if('${list_size%10>0}'=='true'){
        number_click('${Integer.valueOf(list_size/10)+1}');
     }else{
        number_click('${Integer.valueOf(list_size/10)}');
     }
}
function number_down() {
     number_click(1);
}
if(size>10){
   $(function (){
      $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_down()'><<</div> ");
      $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer' onclick='number_onedown()'><</div> ");
      if('${list_size%10>0}'=='true'){
         ssize='${Integer.valueOf(list_size/10)+1}';
     }else{
        ssize='${Integer.valueOf(list_size/10)}';
     }
      for(i=0;i<ssize;i++){
         $('#num_2').append("<div id='a"+(i+1)+"' style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer; margin-left:10px;' onclick='number_click("+(i+1)+")'>"+(i+1)+"</div>");
         $("#num_2").append("<form action='list' method='post' name='numbtn"+(i+1)+"'>"
                 +"<input type='hidden' name='start' id='start"+(i+1)+"'>"
                 +"<input type='hidden' name='end' id='last"+(i+1)+"'>"
                 +"<input type='submit' style='display:none;' id='numbtn"+(i+1)+"'>"
               +"</form>");
         if(i+1=='${Integer.valueOf(list_last/10)}'){
            $("#a"+(i+1)).css("background-color","#383838f2");
            $("#a"+(i+1)).css("color","#fff");
         }
      }
      $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_oneup();' style='text-decoration: none;'>></a></div> ");
      $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='javascript:number_up();' style='text-decoration: none;'>>></a></div>");
   });
}else{
   $(function (){
      $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><<</a></div> ");
      $('#num_1').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'><</a></div> ");
      $('#num_2').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>1</a></div>");
      $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>></a></div> ");
      $('#num_3').append("<div style='margin: 0 auto; text-decoration: none; width: 30px; height: 20px; cursor:pointer'><a href='#' style='text-decoration: none;'>>></a></div>");
   });
}
   
   function title_search() {
      
      alert($("#searchType").val());
      //타입 입력
      $("#type_result").val($("#searchType").val());
      
      if($("#searchType").val()=="title"){
         $("#search_result").val($("#keyword").val());
         alert($("#search_result").val());
         list_form.submit();
      }else if($("#searchType").val()=="Content"){
         $("#search_result").val($("#keyword").val());
         alert($("#search_result").val());
         list_form.submit();
      }else{
         $("#search_result").val($("#keyword").val());
         alert($("#search_result").val());
         list_form.submit();
      }
   }
   function totle_click(d) {
         console.log(d);
         ch=d;
         $("#bno_result").val(d);
         bno_form.submit();
      }
</script>
<jsp:include page="../default/header.jsp"/>
<%-- <%@include file="header.jsp"%> --%>
<div style="width: 1200px; text-align: center; margin: 0 auto;">
<div class="div0">
   <h2 class="h22">
      <font>Q/A<br></font>
   </h2>
</div>
<div align="center" class="div1">

   <table border="0" style="width: 100%;">
      
         <tr>
            <th style="width: 10%;">번호</th>
            <th style="width: 50%;">제목</th>
            <th style="width: 10%;">작성자</th>
            <th style="width: 10%;">작성일</th>
            <th style="width: 10%;">조회수</th>
         </tr>
      <c:forEach var="adminList" items="${listAll}">
      <tr>
         
         <c:choose>
            <c:when test="${adminList.writer.split('_')[0]=='/admin/'}">
            <td><img src="https://attrangs.co.kr/asset/img/board/icon_notice.png"></td>
         </c:when>
            <c:otherwise><td>${adminList.bno}</td></c:otherwise>
         </c:choose>
         <td onclick="totle_click(${adminList.bno})"><label> ${adminList.title} </label><label class="replycount"> [${adminList.replycount}] </label> </td>
         <c:choose>
            <c:when test="${adminList.writer.split('_')[0]=='/admin/'}"><td>관리자</td></c:when>
            <c:otherwise><td>${adminList.writer}</td></c:otherwise>
         </c:choose>
         <td style="font-size: 2px;">${adminList.regdate }</td>
         <td>${adminList.viewcnt }</td>
      </tr>
      </c:forEach>
      
   </table>
   <div style="border-top: 0 none; padding: 10px 0px; border: 0px solid #d7d5d5; background: #ffffff; text-align: center;">
          <span style="float: right; text-align: right;">
             <a class="aa" href="write">글작성</a>
          </span>
   </div>


   <!-- 검색 form -->
   <div id="search" class="div2">
      <!-- search{s} -->
      <div class="form-group row justify-content-center" style="padding-bottom: 10px;">
         <div class="w100" style="padding-right:10px;">
            <select class="se" name="searchType" id="searchType">
               <option class="ooop" value="title">제목</option>
               <option class="ooop" value="Content">본문</option>
               <option class="ooop" value="reg_id">작성자</option>
            </select>
         </div>
         <div>
            <input class="texttt" type="text" class="form-control form-control-sm" name="keyword" id="keyword">
         </div>
         <div>
            <img style="vertical-align: middle; margin:0; padding:0; width: 30px; height: 28px; cursor: pointer;" src="resources/img/scarchhhh.png" name="btnSearch" id="btnSearch" onclick="title_search()">
         </div>
      </div>
      <!-- search{e} -->
   </div>
    <div align="center">
       <div style="display: flex; flex-flow:low; margin-bottom: 50px; justify-content: center;align-items: center;" align="center">
          <div id="num_1" style="display: flex; flex-flow:low; width: 100px;"></div>
          <div id="num_2" style="display: flex; flex-flow:low;"></div>
          <div id="num_3" style="display: flex; flex-flow:low; width: 100px;"></div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../default/footer.jsp"/>
   <form action="view" name="bno_form" method="post">
      <input type="hidden" name="bno" id="bno_result">
   </form>
   <form action="search" name="list_form" method="post">
      <input type="hidden" name="search_result" id="search_result">
      <input type="hidden" name="type_result" id="type_result">
      <input type='hidden' name='start_result' id='start_result' value="1">
      <input type='hidden' name='end_result' id='end_result' value="10">
   </form>
   <input type="hidden" value="${list_search_result}" id="search_result_init">
   <input type="hidden" value="${list_type_result}" id="type_result_init">
</body>