<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="resources/jquery-3.2.1.min.js"></script>


<script type="text/javascript">
   function numUp(d) {
      var num = $("#count"+d).text();
      var product = $("#Pname"+d).text();
      $.ajax({
         url: "num_up",
         type: "GET",
         data: {num:num, product:product},
         success:function(data){
            $("#count").text(data);
         },
         error: function() {console.log("실패")}
      })
            z = parseInt($("#count" + d).text()) + 1;
            $("#count" + d).text(z);
           $("#To" + d).text(parseInt($("#count" + d).text())*parseInt($("#mo" + d).text()));
           result();
   }
//  function down(d) {
//  a = $("#count" + d).text();
//  if (parseInt($("#count" + d).text()) > 1) {
//     a = parseInt($("#count" + d).text()) - 1;
//  }
//  $("#count" + d).text(a);
//  $("#mos" + d).text(
//        parseInt($("#count" + d).text())
//              * parseInt($("#mo" + d).text()) + "");
//  moneysum=0;
//  countsum=0
//  result();
//}
   function numDown(d) {
      var num = $("#count"+d).text();
      var product = $("#Pname"+d).text();
      
    if (parseInt($("#count" + d).text()) > 1) {
        a = parseInt($("#count" + d).text()) - 1;
        
    }
      
      $.ajax({
         url: "num_down",
         type: "GET",
         data: {num:num, product:product},
         success:function(data){
            $("#count").text(data);
            
         },
         error: function() {console.log("실패");console.log(num);}
      })
            z = parseInt($("#count" + d).text()) - 1;
            $("#count" + d).text(z);
           $("#To" + d).text(parseInt($("#count" + d).text())*parseInt($("#mo" + d).text()));
           result();
   }
   



   
   function result() {
      var size = ${cartlist.size()};
      var moneysum=0;
      var countsum=0;
      
      for(i = 0; i < size; i++){
         moneysum+=parseInt($("#To" + i).text());
         countsum+=parseInt($("#count" + i).text());
      }
      $("#sum").val(countsum);
      $("#sum2").val(countsum);
      $("#moneyTotal").val(moneysum);
      
      $("#total").val(parseInt($("#moneyTotal").val()) + 2500);
      
      $("#total2").val(parseInt($("#moneyTotal").val()) + 2500);
      $("#fpro").val($("#Pname"+0).text());
      
   }

   $(function() {   
      result();
   })
   
   
   function del(d) {
      console.log("#url" + d)
      z = $("#url" + d).prop('src');
      location.href = "listdel?img=" + z;
      moneysum=0;
      result();
   }  
</script>
</head>
<body>
   <!-- 
   총합  갯수  처음이름
   cartlist에 담긴 값
   z[0]=arr.get(i).getImg();
   z[1]=arr.get(i).getId();
   z[2]=arr.get(i).getProduct();
   z[3]=arr.get(i).getCancelok();
   z[4]=arr.get(i).getPrice();
   z[5]=String.valueOf(i); 
-->
   <%@include file="../default/header.jsp"%>
   <fmt:requestEncoding value="utf-8" />
   <div style="padding-top: 80px;" align="center">
      <font size="4"><b>CART</b></font>
      <table style="margin-top: 20px;" border="1">
         <tr>
            <th style="width: 100px; font-size: 20px;">사진</th>
            <th style="width: 300px; font-size: 20px;">상품명</th>
            <th style="width: 100px; font-size: 20px;">가격</th>
            <th style="width: 100px; font-size: 20px;">결제결과</th>
            <th style="height: 50px; width: 100px; font-size: 30px;">수량</th>
            <th style="width: 100px; font-size: 20px;">기타</th>
         </tr>
         <c:forEach var="dto" items="${cartlist}">
            <tr>
               <td style="height: 50px; width: 200px;" align="center"><img style="height: 100px; width: 100px;" src="${dto[0]}" id="url${dto[5]}"></td>
               <td style="height: 50px;"><label id="Pname${dto[5]}">${dto[2]}</label></td>
               <td style="height: 50px; width: 200px;">
                        단가 : <label id="mo${dto[5]}">${dto[4]}</label><br> 
                        총합 : <label id="To${dto[5]}">${dto[4] * dto[6]}</label>
               </td>
               <td style="height: 50px; width: 200px;"><label id="cancelok">${dto[3]}</label></td>
               <td style="height: 50px; width: 100px;" align="center"><input
                  type="button" value="-"  onclick="numDown('${dto[5]}')"> <label
                  style="margin-left: 10px; margin-right: 10px;" id="count${dto[5]}">${dto[6]}</label>
                  <input type="button" value="+" onclick="numUp('${dto[5]}')">
               </td>
               <td style="width: 50px;" align="center"><a href="#"
                  onclick="del('${dto[5]}')"><font size="5">삭제</font></a></td>
            </tr>
         </c:forEach>
      </table>
   </div>
   

   
   
<!--    바로결제로가는 div -->
   <div align="center" style="margin-top: 30px;">
      <form action="orderForm">
         <input type="hidden" name="list" value="${cartlist}">
      <input type="hidden" id="total" name="total">
      <input type="hidden" id="sum" name="sum">
         <table>
            <tr>
               <th colspan="5">총수량 : <input type="text" value="0"name="sum2" id="sum2" style="border: none;" disabled="disabled">
               가격:<input type="text" value="0" name="moneyTotal" id="moneyTotal" style="border: none;" disabled="disabled"> 
               배송비 : <input type="text" value="2500" name="coopang" style="border: none;" disabled="disabled"> 
               합계 : <input type="text" value="0" name="total2" id="total2" style="border: none;" disabled="disabled">
               </th>
            </tr>
         </table>
         <button type="submit"  style="width: 350px; background-color: black; height: 50px; margin-top: 25px;" ><font color="white" size="4">주문서 작성</font></button>
      </form>
         
   </div>

</body>
</html>