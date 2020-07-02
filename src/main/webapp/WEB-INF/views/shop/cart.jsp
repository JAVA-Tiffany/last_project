
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
	 
	 
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 500px;
	height: 500px;
	margin: 0 auto;
	padding: 0 0 50px 0;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
 
</style>
<script src="/Tiffany/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
	$(document).ready(function() {
		$(".checkBtn").click(function() {
			var str1 = ""
			var str2 = ""
			var str3 = ""
			var str4 = ""
			var tdArr = new Array();
			var checkBtn = $(this);

			// 체크된 체크박스 값을 가져온다
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();

			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var img = td.eq(0).text()
			product = td.eq(1).text()
			var price = td.eq(2).text()
			count = td.eq(3).text()

			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			console.log("no : " + product);
			console.log("userid : " + price);
			console.log("name : " + count);
			//console.log("email : " + email);

			str1 += td.eq(1).text();
			str2 += td.eq(2).text();
			str3 += td.eq(3).text();
			str4 += td.eq(4).text();

			$("#check1").html(str1);

			$("#check2").html(str2); //product

			$("#check3").html(str3); //price

			//$("#check4").html("선택된 데이터 = "+ tr.text());	
			$("#check5").html(str4); //count

		});

	});
</script>

<script>
	function modal_popup() {
		document.getElementById("modal").style.display = "block";
	}

	function modal_close() {
		var num = document.getElementById("modaltestnum").value
		console.log(num)

		$("#amuntinit").html(num);
		document.getElementById("modal").style.display = "none";
	}

	function modal_realclose() {
		document.getElementById("modal").style.display = "none";
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".DBconfirm")click(function() {
				var num = document.getElementById("modaltestnum").value
				console.log(product)
				location.href = "cartCount.jsp?count="+ num+ "&product="+ product;
				});
		});
</script>
</head>
<body style="font-family: Yu Gothic;">
	<%@include file="../default/header.jsp"%>
	<fmt:requestEncoding value="utf-8" />
	<div style="text-align: center; padding-top: 80px;" align="center">
		<font size="4"><b>CART</b></font>
		<table border="1" align="center" style="margin-top: 20px; width: 500px; height: 50px; border-collapse: collapse; border-top: 1px; border-left: 1px; border-right: 1px;">
			<tr>
				<th colspan="2" style="width: 200px;">상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>기타</th>
			</tr>
			<c:forEach var="dto" items="${cartlist}">
				<tr>
					<td style="height: 100px;"><img src="resources/img/pitting${dto.product}"></td>
					<td style="height: 100px;">${dto.product}</td>
					<td style="height: 100px;">${dto.price}</td>
					<td style="height: 100px;"><label id=amuntinit>${dto.count }</label></td>
					<td>
						<a href="#" onclick="modal_popup()" class="checkBtn"><font size="1">수량변경</font></a><br> <!--          <input value="장바구니" id="selectBtn" type="button"> -->
						<a href="#"><font size="1">주문하기</font></a><br>
						<a href="#"><font size="1">삭제</font></a><br>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-lg-12" id="ex3_Result1"></div>
	<div class="col-lg-12" id="ex3_Result2"></div>




	<div id="modal">
		<div class="modal_content">
			<h2>모달 창</h2>
			<p>모달 창 입니다.</p>
			<b id="check1"></b> <b id="check2"></b> <b id="check3"></b>
			<b id="check4"></b>
			<form>
				<input style="width: 20px;" type="text" name="amount" id="modaltestnum" value="${check4 }">
				<input type="button" name="up" value="+" onclick="javascript:this.form.amount.value++;">
				<input type="button" name="doun" value="-" onclick="javascript:this.form.amount.value--;">
			</form>
			       
			<button type="button" onclick="modal_close()" class="DBconfirm">확인</button>
			<button type="button" onclick="modal_realclose()">닫기</button>
		</div>
		   
		<div class="modal_layer"></div>
	</div>
</body>
</html>