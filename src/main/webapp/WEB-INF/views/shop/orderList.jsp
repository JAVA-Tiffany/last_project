<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>
</head>
<body>
   <%@include file="../default/header.jsp"%>
   <div style="padding-top: 80px;" align="center">
      <font size="4"><b>ORDER</b></font>
      <table style="margin-top: 20px;" border="1">
         <tr>
            <th style="width: 100px; font-size: 20px;">사진</th>
            <th style="width: 300px; font-size: 20px;">상품명</th>
            <th style="width: 100px; font-size: 20px;">가격</th>
            <th style="width: 100px; font-size: 20px;">수량</th>
            <th style="width: 100px; font-size: 20px;">결제결과</th>
         <th style="width: 100px; font-size: 20px;">결제날짜</th>
         </tr>
         <c:forEach var="dto" items="${order_list}">
            <tr>
               <td style="height: 50px; width: 200px;" align="center"><img style="height: 100px; width: 100px;" src="${dto.img}"></td>
               <td style="height: 50px;"><label >${dto.product}</label></td>
               <td style="height: 50px; width: 200px;">
                        단가 : <label >${dto.price}</label><br> 
                        총합 : <label >${dto.totalprice}</label>
               </td>
               <td style="height: 50px; width: 200px;"><label id="cancelok">${dto.count }</td>
               <td style="height: 50px; width: 200px;"><label id="cancelok">${dto.status}</label></td>
               <td style="height: 50px; width: 200px;"><label id="cancelok">${dto.day}</label></td>
         </c:forEach>
      </table>
   </div>
</body>
</html>