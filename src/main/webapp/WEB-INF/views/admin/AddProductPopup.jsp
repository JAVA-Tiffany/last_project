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
   
   $("#type").change(function(){
	      var type = $("#type option:selected").val();
	      console.log(type)
	      if(type =='earring pitting'){
	    	  console.log(type)
	    	  $("#singleUpload").css('display','none');
	    	  $("#multiUpload").removeAttr('style');
	    	  
	      }else{
	    	  console.log(type)
	    	  $("#singleUpload").removeAttr('style');
	    	  $("#multiUpload").css('display','none');
	      }
	      
	   });
   
   $("#priceInput").change(function(){
		var price = $("#priceInput").val();
		console.log(typeof(price))
		if(typeof(price)!="number"){
			alert("가격은 숫자만 기입가능합니다!")
			$("#priceInput").text("");
			$("#priceInput").focus();
		}
	   
   });
   
   $("#quantityInput").change(function(){
		var quantity = $("#quantityInput").val();
		console.log(quantity)
		if(typeof(quantity)!="number"){
			alert("가격은 숫자만 기입가능합니다!")
			$("#quantityInput").text("");
			$("#quantityInput").focus();
		}
	   
  });
  
   
   
   
});
   

</script>
</head>
<body>



<form method="post" enctype="multipart/form-data" id="FormData">
   <table border="1" class="table" id="hhh">
      <tr>
         <th>상품 이름 </th><th><input type="text" name="product"></th>
      </tr>
      <tr>
         <th>상품 가격 </th><th><input type="text" id="priceInput" name="price"></th>
      </tr>
      <tr>
         <th>상품 수량 </th><th><input type="text" id="quantityInput" name="quantity"></th>
      </tr>
      <tr>
         <th>상품 종류 </th>
         <th><select name="type" id="type">
         <option>종류를 선택하세요</option>
         <option value="bag pitting">가방</option>
         <option value="dress pitting">의류</option>
         <option value="earring pitting">귀걸이/귀찌</option>
         <option value="phon pitting">폰케이스</option>
         </select></th>
      </tr>
      <tr>
         <th>피팅 이미지 업로드</th>
         <th><input type="file" id="File" name="File"/>
      </tr>
            <tr id="singleUpload">
            <th>디자인 이미지 업로드</th>
            <th><input type="file" id="SingleDesignFile" name="SingleDesignFile"/>
            </tr>
      <tr style="display: none;" id="multiUpload">
         <th>디자인 이미지 업로드</th>
         <th><input type="file" id="DesignFile" name="DesignFile" multiple="multiple" />
  	 </tr>
</table>
<input type="button" value="등록" id="SubBtn">
</form>
</body>
</html>