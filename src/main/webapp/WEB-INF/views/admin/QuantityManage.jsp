<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.table {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
   
  	.div1 {
	padding-top: 200px;
	padding-bottom: 100px;
	}
	.div2{
	padding-top: 40px;
	}
</style>
</head>
<body>
<c:if test="${sessionScope.id ne 'admin' }">
<script type="text/javascript">
	alert("관리자만 접근가능합니다")
	location.href="index"
</script>
</c:if>
<script type="text/javascript">

$(document).ready(function() {
	index =0;
	$(".Modifybtn1").click(function(){ 
		index = $(this).closest('tr').prevAll().length-1; 
		console.log('trNum : ' + index);
		
        var str = ""
        var tdArr = new Array();    // 배열 선언
        var Modifybtn1 = $(this);

        var tr = Modifybtn1.parent().parent();
        var td = tr.children();
       
       var quantity = document.getElementsByClassName("quantityData")[index].value;
       console.log(quantity)
        var no = td.eq(1).text();
       	
        
        $.ajax({
            url: "modifyQuantity",
            type: "POST",
            data: {quantity:quantity,product:no},
            success: function(data){
                reloadList();
            },
            error: function(){
                alert("error");
            }
     
        });
    });
});
	
	function reloadList(){
		location.reload();
	}
</script>
<div align="center" class="div1">

	<table border="1" class="table" id="thetable">
		<caption><font style="font: 400 30px 'Poppins',sans-serif;">재고 관리<br></font></caption>
			<tr>
				<th style="width: 3%;"></th>
				<th style="width: 50%;">제목</th>
				<th style="width: 10%;">가격</th>
				<th style="width: 10%;">재고</th>
				<th style="width: 10%;">재고수정</th>
				<th style="width: 10%;">수정</th>
			</tr>

	<c:forEach var="dress" items="${dress}">
      <tr>
      	<td><input type="checkbox" name="checkBtn"></td>
         <td>${dress.product }</td>
         <td>${dress.price }</td>
         <td>${dress.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn1" value="수정"/></td>
      </tr>
      </c:forEach>
      <c:forEach var="bag" items="${bag}">
      <tr>
      	<td><input type="checkbox" name="checkBtn"></td>
         <td>${bag.product }</td>
         <td>${bag.price }</td>
         <td>${bag.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn2" value="수정"/></td>
      </tr>
      </c:forEach>
      <c:forEach var="ear" items="${earling}">
      <tr>
      	<td><input type="checkbox" name="checkBtn"></td>
         <td>${ear.product }</td>
         <td>${ear.price }</td>
         <td>${ear.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn3" value="수정"/></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5" style="text-align: center;">
            <button type="button" id="Delbutton">글삭제</button>
         </td>
      </tr>
   </table>
</div>
</body>
</html>