<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.2.1.min.js"></script>


<script type="text/javascript">
	var size = ${cartlist.size()};
	var moneysum=0;
	var countsum=0;
	
	function result() {
		
		for(i = 0; i < size; i++){
			moneysum+=parseInt($("#mos" + i).text());
			countsum+=parseInt($("#count" + i).text());
		}
		$("#moneyTotal").val(moneysum);
		$("#sum").val(countsum);
		$("#total").val(parseInt($("#moneyTotal").val()) + 2500);
	}

	$(function() {
		$("#fpro").val($("#Pname").text());
		for(i = 0; i < size; i++){
			moneysum+=parseInt($("#mos" + i).text());
			countsum+=parseInt($("#count" + i).text());
		}
		$("#moneyTotal").val(moneysum);
		$("#sum").val(countsum);
		$("#total").val(parseInt($("#moneyTotal").val()) + 2500);
		
	})
	
	
	function del(d) {
		console.log("#url" + d)
		z = $("#url" + d).prop('src');
		location.href = "listdel?img=" + z;
		moneysum=0;
		result();
	}
	function up(d) {
		z = parseInt($("#count" + d).text()) + 1;
		$("#count" + d).text(z);
		$("#mos" + d).text(
				parseInt($("#count" + d).text())
						* parseInt($("#mo" + d).text()) + "");
		moneysum=0;
		countsum=0
		result();
	}
	function down(d) {
		a = $("#count" + d).text();
		if (parseInt($("#count" + d).text()) > 1) {
			a = parseInt($("#count" + d).text()) - 1;
		}
		$("#count" + d).text(a);
		$("#mos" + d).text(
				parseInt($("#count" + d).text())
						* parseInt($("#mo" + d).text()) + "");
		moneysum=0;
		countsum=0
		result();
	}

	
	
	   function buy() {
	      var buy = document.bbuy;
	      
	       var popupX = (window.screen.width / 2) - (1300 / 2);
	       var popupY= (window.screen.height /2) - (850 / 2);
	       openWin = window.open("",
	               "bbbuy", 'status=no, height=750, width=1100, left='+ popupX + ', top='+ popupY +
				' , screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
	       buy.action="buy";
	       buy.method="post";
	       buy.target="bbbuy";
	       buy.change_val='${fpro}';
	       buy.change_val='${sum}';
	       buy.change_val='${total}';
	       buy.submit();
	       
	   }

//        var openWin;
       
//        function openChild()
//        {
//            // window.name = "부모창 이름"; 
//            window.name = "cart";
//            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
//            openWin = window.open("buy",
//                    "bbuy", "width=570, height=350, resizable = no, scrollbars = no");    
//        }
       
//        function setChildText(){
//            openWin.document.getElementById("fpro").value = document.getElementById("fpro").value;
//            openWin.document.getElementById("sum").value = document.getElementById("sum").value;
//            openWin.document.getElementById("total").value = document.getElementById("total").value;
//        }

	
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
   z[4]=arr.get(i).getMoney();
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
					<td style="height: 50px; width: 200px;" align="center"><img
						style="height: 100px; width: 100px;" src="${dto[0]}"
						id="url${dto[5]}"></td>
					<td style="height: 50px;"><label id="Pname">${dto[2]}</label></td>
					<td style="height: 50px; width: 200px;">단가 : <label
						id="mo${dto[5]}">${dto[4]}</label><br> 총합 : <label
						id="mos${dto[5]}">${dto[4]}</label>
					</td>
					<td style="height: 50px; width: 200px;"><label id="cancelok">${dto[3]}</label></td>
					<td style="height: 50px; width: 100px;" align="center"><input
						type="button" value="-" onclick="down('${dto[5]}')"> <label
						style="margin-left: 10px; margin-right: 10px;" id="count${dto[5]}">1</label>
						<input type="button" value="+" onclick="up('${dto[5]}')">
					</td>
					<td style="width: 50px;" align="center"><a href="#"
						onclick="del('${dto[5]}')"><font size="5">삭제</font></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div align="center" style="margin-top: 30px;">
		<form name="bbuy">
			<input type="hidden" id="fpro" name="fpro">
			<input type="hidden" id="sum" name="sum">
			<input type="hidden" id="total" name="total">
			<table>
				<tr>
					<th colspan="5">총수량 : <input type="text" value="0"name="sum" id="sum" style="border: none;" disabled="disabled">
					가격:<input type="text" value="0" name="moneyTotal" id="moneyTotal" style="border: none;" disabled="disabled"> 
					배송비 : <input type="text" value="2500" name="coopang" style="border: none;" disabled="disabled"> 
					합계 : <input type="text" value="0" name="total" id="total" style="border: none;" disabled="disabled">
					</th>
				</tr>
			</table>
		</form>
			<button type="button" onclick="buy()" style="width: 350px; background-color: black; height: 50px; margin-top: 25px;" ><font color="white" size="4">주문서 작성</font></button>
		
	</div>


</body>
</html>