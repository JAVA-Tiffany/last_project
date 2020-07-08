<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
<style type="text/css">
   .font{ font-family: Yu Gothic;}
   .img1 { display: inline; }
   .img2 {  }
   .scrolltop {
        display: none;
        position: fixed;
        right: 30px;
        bottom: 50px;
        z-index: 1030;
        font-size: 1.875rem;
        color: #868e96;
        transition: all 0.5s ease-in-out;
        opacity: 0.8;
      }
      .scrolltop:hover,
      .scrolltop:focus {
        color: #dc3545;
        transition: all 0.5s ease-in-out;
      }
</style>
<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<body>
<jsp:include page="header.jsp"/>
<%-- <%@include file="header.jsp" %> --%>

<div  style=" width: 600px; text-align: center; padding-top: 120px; ">
<font class="font" style=" color: #3a5080;" size="7"><b>My own little things</b></font><br>
<font class="font" style=" color: #3a5080;" size="7"> [ drawing jewelry ]</font><br>
<!-- <font style="font-family: Yu Gothic;" size="3"> </font><br> -->
</div>

<!-- <font class="font" size="7">나만의 상품</font> -->
<!-- 귀걸이 -->
<div class="img1" onclick="location.href='earring'">
<img src="resources/img/2.jpg" onclick="location.href='earring'" style=" padding-left: 500px;padding-top:50px; width: 600px; ">
<img src="resources/img/5.png" onclick="location.href='earring'" style=" padding-top:50px; width: 500px; height: 800px;  "></div>


<div class="img2" onclick="location.href='earring'">
<img src="resources/img/04.jpg" onclick="location.href='earring'" style="padding-left: 100px; padding-top:50px; width: 500px;">
<img src="resources/img/3.jpg" onclick="location.href='earring'" style="padding-left: 500px; width: 400px;" ></div>

<!-- 가방  -->
<div class="img3" onclick="location.href='bag'">
<img src="resources/img/10.JPG" onclick="location.href='bag'" style=" padding-left: 500px;padding-top:50px; width: 600px; ">
<img src="resources/img/11.png" onclick="location.href='bag'" style=" padding-top:50px; width: 500px; height: 800px;  "></div>

<div class="img4" onclick="location.href='bag'" >
<img src="resources/img/6.png" onclick="location.href='bag'" style="padding-left: 100px; padding-top:50px; width: 500px;">
<img src="resources/img/12.png" onclick="location.href='bag'" style="padding-left: 500px; width: 400px;" ></div>

<!-- 의류 -->

<div class="img5" onclick="location.href='dress'">
<img src="resources/img/15.png" onclick="location.href='dress'" style=" padding-left: 500px;padding-top:50px; width: 500px; ">
<img src="resources/img/16.png" onclick="location.href='dress'" style="  "></div>

<div class="img6" onclick="location.href='dress'">
<img src="resources/img/13.png" onclick="location.href='dress'" style="padding-left: 100px; padding-top:50px; width: 500px;">
<img src="resources/img/14.png" onclick="location.href='dress'" style="padding-left: 500px; width: 400px;" ></div>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
      jQuery(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
          } else {
            $('#backToTop').fadeOut('slow');
          }
        });
        $('#backToTop').click(function (e) {
          e.preventDefault();
          $('html, body').animate({scrollTop: 0}, 200);
        });
      });
    </script>
    <!-- top버튼 -->
<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
</a>

<%@include file="footer.jsp" %>

</body>
</html>
