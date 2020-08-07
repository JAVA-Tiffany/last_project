<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
$(document).ready(function() {
   $("#SubBtn").click(function(){
      var form =$("#FormData")[0];
      var data = new FormData(form);
      $.ajax({
               url: "AddProduct",
               type: "POST",
               data: data,
               contentType : false,
               processData : false,
               success: function(data){
                   alert("success");
                   window.close();
               },
               error: function(){
                   alert("error");
                   window.close();
               }
           });
   });
});
   

</script>
</head>
<body>



<form method="post" enctype="multipart/form-data" id="FormData">
   <table border="1" class="table">
      <tr>
         <th>상품 이름 </th><th><input type="text" name="product"></th>
      </tr>
      <tr>
         <th>상품 가격 </th><th><input type="text" name="price"></th>
      </tr>
      <tr>
         <th>상품 수량 </th><th><input type="text" name="quantity"></th>
      </tr>
      <tr>
         <th>이미지 업로드</th>
         <th><input type="file" id="File" name="File" />
<!--          <th><input type="file" name="img"></th> -->
      </tr>
      <tr>
         <th>상품 종류 </th>
         <th><select name="type">
         <option>종류를 선택하세요</option>
         <option value="bag pitting">가방</option>
         <option value="dress pitting">의류</option>
         <option value="earring pitting">귀걸이/귀찌</option>
</select></th>
      </tr>
      <tr>
         <th colspan="5"><input type="button" value="등록" id="SubBtn"></th>
      </tr>

</table>
</form>
</body>
</html>