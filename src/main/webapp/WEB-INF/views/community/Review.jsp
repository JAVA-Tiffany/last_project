<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   function review_insert() {
      review_write.submit();
   }
   function review_search() {
      alert("서치")
      $("#type").val($("#search_key").val());
      $("#search_img").val($("#img").val());
      $("#search_text").val($("#search").val());
      search_form.submit();
   }
   function del(d) {
      if("${sessionScope.id}"==$("#name"+d).text()){
         $.ajax({
               url : "review_delect",
               type : "POST",
               data : {rno:$("#rno"+d).text()},
               success : function(data) {
                  $("tr").remove("#rtr"+d);
                  $("tr").remove("#rrtr"+d);
               },
               error : function() {
                  alert('문제 발생')
               }
         });
      }else{
         alert("본인이 올린 글만 삭제할 수 있습니다.");
      }
   }
   var s=0;
   function review_op(d) {
      $.ajax({
            url : "infocount_up",
            type : "POST",
            data : {rno:$("#rno"+d).text()},
            success : function(data) {
               text=$("#content"+d).val();
               if(s==0){
                  $("#infocount"+d).text(parseInt($("#infocount"+d).text())+1);
                  $("#dtr"+d).append("<textarea id='area"+d+"' style='resize: none; width: 50%; height:300px; margin-top:0px' cols='1' >"+text+"</textarea>");
                  $("#dtr"+d).append("<input id='text_change"+d+"' onclick='review_change("+d+")' type='button' value='수정'>");
                  $("#open_btn"+d).val("▲");
                  $("#title"+d).removeAttr('disabled');
                  s++;
               }else{
                  s=0;
                  $("textarea").remove("#area"+d);
                  $("input").remove("#text_change"+d);
                  $("#open_btn"+d).val("▼");
                  $("#title"+d).attr("disabled","disabled");
               }
            },
            error : function() {
               alert('문제 발생')
            }
      });
   }
   function review_change(d) {
      $("#content"+d).val($("#area"+d).val());
      $("#title"+d).attr('disabled','disabled');
      $("#area"+d).attr('disabled','disabled');
      $.ajax({
            url : "review_update",
            type : "POST",
            data : {content:$("#content"+d).val(),title:$("#title"+d).val(),rno:d},
            success : function(data) {
            alert("수정 완료")
            s=0;
            $("textarea").remove("#area"+d);
                $("input").remove("#text_change"+d);
                $("#open_btn"+d).val("▼");
                $("#title"+d).attr("disabled","disabled");
            },
            error : function() {
               alert('문제 발생')
            }
      });
   }
</script>
<style type="text/css">
.div1 {
   padding-top: 200px;
   padding-bottom: 100px;
   font: 400 14px 'Poppins', sans-serif;
}

table {
   width: 780px;
   border-top: 1px solid #444444;
   border-collapse: collapse;
}

th, td {

   padding: 10px;
   text-align: center;
}

a {
   text-decoration: none;
   color: #000;
   !
   important
}

a:link {
   color: #000;
   text-decoration: none;
}

<!--
link : 방문전 링크 상태 -->a:visited {
   color: #000;
   text-decoration: none;
}

<!--
visited : 방문후 링크 상태 -->a:hover {
   color: #000;
   text-decoration: none;
}

<!--
hover : 마우스 오버했을 때 링크 상태 -->a:active {
   text-decoration: none;
   color: #000;
}

<!--
active : 클릭했을 때 링크 상태 -->fieldset {
   border: none;
   vertical-align: top;
}
textarea{width: 300px; height: 400px; resize: none; margin-top: 260px; text-align: center;}
</style>
</head>
<body>
   <jsp:include page="../default/header.jsp"/>
   <div style="display: flex; flex: row; width: 1100px; margin: 0 auto;" align="center">
      <textarea id="textarea_listAll" cols="1" readonly="readonly">${review_listAll}</textarea>
      <div align="center" class="div1" style="margin-left: 30px">
         <table>
            <caption>
               <font style="font: 400 30px 'Poppins', sans-serif;">Review <br></font>
               현재 선택 상품 : <input type="text" style="width: 300px; text-align: center;" value="${review_img}" id="img" disabled="disabled">
            </caption>
            <tr>
               <th style="width: 8%;">번호</th>
               <th style="width: 30%;">제목</th>
               <th style="width: 15%;">작성자</th>
               <th style="width: 30%;">작성일</th>
               <th style="width: 8%;">조회수</th>
               <th style="width: 10%;">비고</th>
               <th></th>
            </tr>
            <c:choose>
               <c:when test="${review_list.size()==0}">
                  <tr>
                     <td colspan="5" style="text-align: center; height: 200px;">검색
                        결과가 없습니다.<br>
                     </td>
                  </tr>
               </c:when>
               <c:otherwise>
                  <c:forEach var="dto" items="${review_list}">
                     
                     <input id="content${dto.rno}" type="hidden" value="${dto.content}">
                     <tr id="rtr${dto.rno}" style="border-top: 1px solid #444444;">
                        <td style="height: 50px; width: 100px;" align="center">
                           <label id="rno${dto.rno}">${dto.rno}</label>
                        </td>
                        <td style="height: 50px; width: 100px;">
                           <input type="text" id="title${dto.rno}" value="${dto.title}" disabled='disabled'>
                        </td>
                        <td style="height: 50px; width: 100px;">
                           <label id="name${dto.rno}">${dto.name}</label>
                        </td>
                        <td style="height: 50px; width: 200px;">
                           <label id="regdat${dto.rno}">${dto.regdat}</label>
                        </td>
                        <td style="height: 50px; width: 100px;">
                           <label id="infocount${dto.rno}">${dto.infocount}</label>
                        </td>
                        <td style="height: 50px; width: 100px;">
                           <label onclick="del(${dto.rno})">삭제</label>
                        </td>
                        <td>
                           <input id="open_btn${dto.rno}" type="button" onclick="review_op(${dto.rno})" value="▼">
                        </td>
                     </tr>
                     <tr id="rrtr${dto.rno}" align="center">
                        <td id="dtr${dto.rno}" style="width: 70%;" colspan="7">
                           
                        </td>
                     </tr>
                  </c:forEach>
                     <tr style="border-top: 1px solid #444444;"><td style="width: 70%;" colspan="7"></td></tr>
               </c:otherwise>
            </c:choose>
         </table>
         
         <p class="category displaynone"></p>
         <p>
            <select id="search_key" name="search_key">
               <option value="subject">제목</option>
               <option value="content">내용</option>
               <option value="member_id">아이디</option>
               <option value="product">상품 바꾸기</option>
            </select> 
            <input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text" />
            <label onclick="review_search()" onmouseover="style='cursor:pointer'">search</label>
            <label onclick="review_insert()" onmouseover="style='cursor:pointer'">등록</label>
         </p>
      </div>
   </div>
   <jsp:include page="../default/footer.jsp"/>
<form action="review_write" method="post" name="review_write">
   <input type="hidden" id="review_img" name="review_img" value="${review_img}">
</form>

<form action="review_search" method="post" name="search_form">
   <input type="hidden" id="search_img" name="search_img">
   <input type="hidden" id="type" name="type">
   <input type="hidden" id="search_text" name="search_text">
</form>

</body>
</html>