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
	function del(d) {
		console.log("#url"+d)
		z=$("#url"+d).prop('src');
		location.href="listdel?img="+z;
	}
	function up(d) {
		z=parseInt($("#count"+d).text())+1;
		$("#count"+d).text(z);
		$("#mos"+d).text(parseInt($("#count"+d).text())*parseInt($("#mo"+d).text())+"");
	}
	function down(d) {
		a=$("#count"+d).text();
		if(parseInt($("#count"+d).text())>1){
			a=parseInt($("#count"+d).text())-1;
		}
		$("#count"+d).text(a);
		$("#mos"+d).text(parseInt($("#count"+d).text())*parseInt($("#mo"+d).text())+"");
	}
</script>
</head>
<body>
<!-- 
	cartlist에 담긴 값
	z[0]=arr.get(i).getImg();
	z[1]=arr.get(i).getId();
	z[2]=arr.get(i).getProduct();
	z[3]=arr.get(i).getCancelok();
	z[4]=arr.get(i).getMoney();
	z[5]=String.valueOf(i); 
-->
	<%@include file="../default/header.jsp"%>
	<div style="padding-top: 80px;" align="center">
		<font size="4"><b>CART</b></font>
		<table style="margin-top: 20px;" border="1">
			<tr>
				<th style="width: 100px; font-size: 20px;">사진</th>
				<th style="width: 300px; font-size: 20px;">상품명</th>
				<th style="width: 100px; font-size: 20px;">가격</th>
				<th style="width: 100px; font-size: 20px;">결제결과</th>
				<th style="height: 50px; width: 100px; font-size: 30px;">수량</th>
				<th style="width: 100px; font-size: 20px;" colspan="2">기타</th>
			</tr>
			<c:forEach var="dto" items="${cartlist}">
				<tr>
					<td style="height: 50px;width: 200px;" align="center"><img style="height: 100px;width: 100px;" src="${dto[0]}" id="url${dto[5]}"></td>
					<td style="height: 50px;"><label>${dto[2]}</label></td>
					<td style="height: 50px;width: 200px;">
						단가 : <label id="mo${dto[5]}">${dto[4]}</label><br>
						총합 : <label id="mos${dto[5]}">${dto[4]}</label>
					</td>
					<td style="height: 50px;width: 200px;"><label id="cancelok">${dto[3]}</label></td>
					<td style="height: 50px;width: 100px;" align="center">
						<input type="button" value="-" onclick="down('${dto[5]}')">
						<label style="margin-left: 10px; margin-right: 10px; " id="count${dto[5]}" >1</label>
						<input type="button" value="+" onclick="up('${dto[5]}')">
					</td>
					<td style="width: 50px;" align="center"><a href="#"><font size="5">결제</font></a></td>
					<td style="width: 50px;" align="center"><a href="#" onclick="del('${dto[5]}')" ><font size="5">삭제</font></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>