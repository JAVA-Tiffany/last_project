<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    text-align:center;
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
<c:if test="${sessionScope.id.split('_')[0] ne 'admin' }">
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
          var type= td.eq(1).text();
        var no = td.eq(2).text();
        
        $.ajax({
            url: "modifyQuantity",
            type: "POST",
            data: {quantity:quantity,product:no,type:type},
            success: function(data){
                reloadList();
            },
            error: function(){
                alert("error");
            }
     
        });
    });
   
   $("#category").change(function(){ 
	   var choice = document.getElementById("category").value
	   console.log(choice)
	  	location.href="categorySelect?choice="+choice;
    
       });
   
   
   $("#AddProduct").click(function(){
		window.open("AddProductPopup","상품등록","width=700px,height=500px");
	   
   })
   
   $(".Deletebtn1").click(function(){ 
	  		 var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			var product = td.eq(3).text();
	      
	      Swal.fire({
	           title: '상품을 삭제하시겠습니까?',
	           text: '선택하신 상품 : '+product+' 을 정말 삭제하시겠습니까?',
	           icon: 'warning',
	           showCancelButton: true,
	           confirmButtonColor: '#3085d6',
	           cancelButtonColor: '#d33',
	           confirmButtonText: 'Yes, delete it!'
	      }).then((result) => {
	           if (result.value) {
	             Swal.fire({
	                title:'Deleted!',
	                text: '성공적으로 삭제되었습니다!',
	                icon: 'success',
	               preConfirm:function(){
	            	   $.ajax({
	                       url: "DelProduct",
	                       type: "POST",
	                       data: {product:product},
	                       success: function(data){
	                           reloadList();
	                       },
	                       error: function(){
	                           alert("error");
	                       }
	                
	                   });
	                }
	             })
	           }
	         })
	   });
});
   
   function reloadList(){
      location.reload();
   }
   
   
</script>
<jsp:include page="AdminHeader.jsp"/>   

<div><input type="button" id="AddProduct" value="상품등록"></div>

<div align="center" class="div1">
   <table border="1" class="table" id="thetable">
      <caption><font style="font: 400 30px 'Poppins',sans-serif;">재고 관리<br></font></caption>
         <tr>
            <th style="width: 3%;"></th>
            <th>이미지</th>
            <th style="width: 50%;padding-left: 200px;">제목
            <div align="right" style="float:right;">
			<select name="category" id="category">
				<option>카테고리를 선택해주세요</option>
				<option value="All">전체 목록</option>
				<option value="bag">가방</option>
				<option value="dress">의류</option>
				<option value="earring">귀걸이/귀찌</option>
			</select>
			</div>
            </th>
            <th style="width: 10%;">가격</th>
            <th style="width: 10%;">재고</th>
            <th style="width: 10%;">재고수정</th>
            <th style="width: 10%;">수정</th>
         </tr>
	<c:forEach var="datalist" items="${PickData}">
      <tr>
         <td><input type="checkbox" name="checkBtn"></td>
         <td><img src="${datalist.img }" style="width:150px;height:100px;"></td>
         <td style="display:none;">${datalist.type }</td>
         <td align="center">${datalist.product }</td>
         <td>${datalist.price }</td>
         <td>${datalist.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn1" value="수정"/><input type="button" class="Deletebtn1" value="삭제"/></td>
      </tr>
      </c:forEach>
   <c:forEach var="datalist" items="${datalist}">
      <tr>
         <td><input type="checkbox" name="checkBtn"></td>
         <td><img src="${datalist.img }" style="width:150px;height:100px;"></td>
         <td style="display:none;">${datalist.type }</td>
         <td>${datalist.product }</td>
         <td>${datalist.price }</td>
         <td>${datalist.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn1" value="수정"/><input type="button" class="Deletebtn1" value="삭제"/></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5" style="text-align: center;">
            <button type="button" id="Delbutton">글삭제</button>
         </td>
      </tr>
   </table>
</div>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>