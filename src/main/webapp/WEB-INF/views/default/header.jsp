<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
   href="resources/css/util.css?after">
<link rel="stylesheet" type="text/css"
   href="resources/css/main.css?after">

<script type="text/javascript">
   $(function() {
      $.ajax({
            url : "header_review",
            type : "POST",
            data : "0",
            success : function(data) {
               $("#review_text").val(data);
            },
            error : function() {
               alert('review 발생')
            }
      });
   })
   function review_in() {
      review_form.submit();
   }
</script>
<style type="text/css">
.dropdown {
   position: relative;
   display: inline-block;
}
.dropdown-content {
   display: none;
   position: absolute;
   background-color: #f1f1f1;
   min-width: 80px;
   min-height: 150px;
   text-align: center;
   right: 0px;
   box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
   font-weight: normal;
   font-size: 20px;
   font-family: 윤고딕;
   z-index: 1;
}
.dropdown-content a:hover {
   background-color: #ddd;
}
.dropdown:hover .dropdown-content {
   display: block;
}
.dropdown:hover .dropbtn {
   
}
.dropdown1 {
   position: relative;
   display: inline-block;
}
.dropdown-content1 {
   display: none;
   position: absolute;
   background-color: #f1f1f1;
   min-width: 100px;
   min-height: 150px;
   text-align: center;
   right: 0px;
   box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
   font-weight: normal;
   font-size: 20px;
   font-family: 윤고딕;
   z-index: 1;
}
.dropdown-content1 a:hover {
   background-color: #ddd;
}
.dropdown1:hover .dropdown-content1 {
   display: block;
}
.dropdown1:hover .dropbtn1 {
   
}
.dropdown0 {
   position: relative;
   display: inline-block;
}
.dropdown-content0 {
   display: none;
   position: absolute;
   background-color: #f1f1f1;
   min-width: 80px;
   min-height: 120px;
   text-align: center;
   right: 0px;
   box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
   font-weight: normal;
   font-size: 20px;
   font-family: 윤고딕;
   z-index: 1;
}
.dropdown-content0 a:hover {
   background-color: #ddd;
}
.dropdown0:hover .dropdown-content0 {
   display: block;
}
.dropdown0:hover .dropbtn1 {
   
}
</style>
</head>

<body>
   <div id="fixed">
      <div>
         <h1>
            <a href="index" style="color: black;">Brand</a>
         </h1>
      </div>
      <div>
         <nav>
            <div class="dropdown">
               <span class="dropbtn"><a href="#" style="color: black;">SHOP</a></span>&nbsp;&nbsp;
               <div class="dropdown-content">
                  <a href="#" style="color: black;">ALL</a><br> <a href="#"
                     style="color: black;">RING</a> <a href="#" style="color: black;">EARRING</a>
                  <a href="#" style="color: black;">NECKLACE</a> <a href="#"
                     style="color: black;">BRACELET</a> <a href="#"
                     style="color: black;">CLOTHES</a> <a href="#"
                     style="color: black;">PANTS</a> <a href="#" style="color: black;">BAGS</a>
               </div>
            </div>

            <span><a href="#" style="color: black;">COLLECTION</a></span>&nbsp;&nbsp;
            <span><a href="#" style="color: black;">PROGECT</a></span>&nbsp;&nbsp;
            <span><a href="#" style="color: black;">STOCKIST</a></span>&nbsp;&nbsp;

            <div class="dropdown0">
               <span class="dropbtn0"><a href="#" style="color: black;">COMMUNITY</a></span>&nbsp;&nbsp;
               <div class="dropdown-content0">
                  <a href="notice" style="color: black;">NOTICE</a><br>
                  <a href="list" style="color: black;">Q / A</a><br> 
                  <a href="javascript:review_in()" style="color: black;">REVIEW</a>
               </div>
            </div>

            <div class="dropdown1">
               <span class="dropbtn1"><a href="#" style="color: black;">ACCOUNT</a></span>
               <div class="dropdown-content1">

                  <c:choose>
                     <c:when test="${sessionScope.id eq null}">

                        <span><a href="login" style="color: black;" onclick="openChild()">LOGIN</a></span>
                     </c:when>
                     <c:otherwise>
                        <span><a href="logout" style="color: black;">LOGOUT</a></span>
                        <span><a href="myinfo" style="color: black;">MY INFO</a></span>
                     </c:otherwise>
                  </c:choose>

                  <a href="join" style="color: black;">JOIN US</a>

                  <c:choose>
                     <c:when test="${sessionScope.id eq null}">
                        <script type="text/javascript">
                           function loginafter() {
                              alert("로그인 후 이용바랍니다!")
                           }
                        </script>
                        <a href="#" style="color: black;" onclick="loginafter()">CART</a>
                        <a href="#" style="color: black;" onclick="loginafter()">MYSHOP</a>
                        <a href="#" style="color: black;" onclick="loginafter()">WISH LIST</a>
                        <a href="#" style="color: black;" onclick="loginafter()">ORDER LIST</a>
                     </c:when>
                     <c:otherwise>
                        <a href="cart" style="color: black;">CART</a>
                        <a href="#" style="color: black;">MYSHOP</a>
                        <a href="#" style="color: black;">WISH LIST</a>
                        <a href="#" style="color: black;">ORDER LIST</a>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
         </nav>
      </div>
   </div>

   <form action="review" method="post" name="review_form">
      <input type="hidden" id="review_text" name="review_text">
   </form>

</body>
</html>