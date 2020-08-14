<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://fonts.googleapis.com/icon?family=Material+Icons"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.6/angular-material.min.css"></script> -->
<!-- <script src="https://yourwebsite.com/style.css"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-animate.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-route.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-aria.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular-messages.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.6/angular-material.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js"></script> -->
<!-- <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->

<!-- <style> -->
<!-- body{   -->
<!-- } -->
<!-- .form { -->
<!--     position : absolute;       -->
<!--     top : 50%;       -->
<!--     left : 50%;       -->
<!--     height : 30px;       -->
<!--     padding : 30px 0; -->
<!--     width : 26px;       -->
<!--     transform : translate3d(-50%,-50%,0);  -->
<!-- } -->
<!--  .form:before {  -->
<!--      content: '';   -->
<!--     position: absolute;  -->
<!--     top: 0;  -->
<!--      left: -5px;  -->
<!--      height: 20%;  -->
<!--      width: 48px;  -->
<!--      background-color: #243548;  -->
<!--      border-radius: 50%;  -->
<!--      box-shadow: 10px 0 0 #243548,20px 0 0 #243548,30px 0 0 #243548,40px 0 0 #243548, -->
<!--      			 50px 0 0 #243548,60px 0 0 #243548,75px 0 0 #243548, 150px 0 0 #243548, -->
<!--      			 85px 0 0 #243548,95px 0 0 #243548,105px 0 0 #243548,115px 0 0 #243548,125px 0 0 #243548, -->
<!--      			 135px 0 0 #243548,145px 0 0 #243548;   -->
<!--  }  -->


<!-- .form input { -->
<!--      position: absolute;  -->
<!--     left: -9999px; -->
<!-- } -->
<!-- .bubble{ -->
<!--   position:absolute; -->
<!--   z-index:2; -->
<!--   top:50%; -->
<!--   left:50%; -->
<!--   height:30px; -->
<!--   width:30px; -->
<!--   transform:translate3d(-75%,-50%,0); -->
<!--   margin-left:-50px; -->
<!--   background:#BBBBBB; -->
<!--   border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--   border-right: 0px solid #BBBBBB; -->
<!--   border-left: 0px solid #BBBBBB; -->
<!--   animation: toggle-reverse 2s 1;   -->
<!-- } -->
<!-- #bubble:checked + .bubble{ -->
<!--   animation: toggle 2s 1;   -->
<!--   transform:translate3d(75%,-50%,0);  -->
<!--  background: #3CCC97;    -->
<!-- } -->
<!-- .bubble:after { -->
<!--     content: ''; -->
<!--     position: absolute; -->
<!--     top: 50%; -->
<!--     margin-top: -9px; -->
<!--     margin-left: -2px; -->
<!--     height: 15px; -->
<!--     width: 3px; -->
<!--     background: #fff; -->
<!--     left: 50%; -->
<!--     transform: rotate(45deg); -->
<!--     border-radius: 2px; -->
<!--     transition: 500ms ease all 1.25s; -->
<!-- } -->
<!-- .bubble:before { -->
<!--     content: ''; -->
<!--     position: absolute; -->
<!--     top: 50%; -->
<!--     margin-top: -9px; -->
<!--     margin-left: -2px; -->
<!--     height: 15px; -->
<!--     width: 3px; -->
<!--     background: #fff; -->
<!--     left: 50%; -->
<!--     transform: rotate(-45deg); -->
<!--     border-radius: 2px; -->
<!--     transition: 500ms ease all 1.25s; -->
<!-- } -->

<!-- #bubble:checked + .bubble:after { -->
<!--     content: ''; -->
<!--     position: absolute; -->
<!--     top: 50%; -->
<!--     margin-top: -6px; -->
<!--     margin-left: 3px; -->
<!--     height: 11px; -->
<!--     width: 2px; -->
<!--     background: #fff; -->
<!--     left: 50%; -->
<!--     transform: rotate(225deg); -->
<!--     border-radius: 2px; -->
<!-- } -->
<!-- #bubble:checked + .bubble:before { -->
<!--     content: ''; -->
<!--     position: absolute; -->
<!--     top: 50%; -->
<!-- 	margin-top: -8px; -->
<!--     margin-left: -6px; -->
<!--     height: 15px; -->
<!--     width: 3px; -->
<!--     background: #fff; -->
<!--     left: 50%; -->
<!--     transform: rotate(-215deg); -->
<!--     border-radius: 2px; -->
<!-- } -->
<!-- @keyframes toggle { -->
<!--     0%   { -->
<!--     transform:translate3d(-75%,-50%,0); -->
<!--     border-right: 0 solid #BBBBBB; -->
<!--     border-left: 0 solid #BBBBBB; -->
<!--     background:#BBBBBB; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     height: 30px; -->
<!--     } -->
<!--     20% { -->
<!--     border-right: 0 solid #BBBBBB; -->
<!--     border-left: 0 solid #BBBBBB; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     transform:translate3d(-75%,-50%,0); -->
<!--     height: 30px; -->
<!--     }  -->
<!--     40%  { -->
<!--     border-left: 0 solid #BBBBBB; -->
<!--     border-radius: 35% 65% 65% 35% / 50% 50% 50% 50%; -->
<!--     height: 25px; -->
<!--     } -->
<!--     50%  { -->
<!--     transform:translate3d(0%,-50%,0); -->
<!--     border-right: 25px solid #BBBBBB; -->
<!--     border-left: 0 solid #BBBBBB; -->
<!--     background:#BBBBBB; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     height: 25px;    -->
<!--     } -->
<!--     75%  { -->
<!--     border-left: 25px solid #3CCC97; -->
<!--     border-color:#3CCC97; -->
<!--     background: #3CCC97; -->
<!--     border-radius: 65% 35% 35% 65% / 50% 50% 50% 50%; -->
<!--     height: 25px; -->
<!--     } -->
<!--     100% { -->
<!--     border-right: 0 solid #3CCC97; -->
<!--     border-left: 0 solid #3CCC97; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     transform:translate3d(75%,-50%,0); -->
<!--     height: 30px; -->
<!--     width:30px -->
<!--     } -->
<!-- } -->


<!-- @keyframes toggle-reverse { -->
<!--     0%   { -->
<!--     transform:translate3d(75%,-50%,0); -->
<!--     background: #3CCC97; -->
<!--     border-right: 0 solid #3CCC97; -->
<!--     border-left: 0 solid #3CCC97; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     height: 30px; -->
<!--     } -->
<!--     20% { -->
<!--     border-right: 0 solid #3CCC97; -->
<!--     border-left: 0 solid #3CCC97; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     transform:translate3d(75%,-50%,0); -->
<!--     height: 30px; -->
<!--     }  -->
<!--     40%  { -->
<!--     border-right: 0 solid #3CCC97; -->
<!--     border-radius: 65% 35% 35% 65% / 50% 50% 50% 50%; -->
<!--     height: 25px; -->
<!--     } -->
<!--     50%  { -->
<!--     transform:translate3d(0%,-50%,0); -->
<!--     border-left: 25px solid #3CCC97; -->
<!--     border-right: 0 solid #3CCC97; -->
<!--     background: #3CCC97; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     height: 25px;    -->
<!--     } -->
<!--     75%  { -->
<!--     border-right: 25px solid #BBBBBB; -->
<!--     border-color:#BBBBBB; -->
<!--     background:#BBBBBB; -->
<!--     border-radius: 35% 65% 65% 35% / 50% 50% 50% 50%; -->
<!--     height: 25px; -->
<!--     } -->
<!--     100% { -->
<!--     border-right: 0 solid #BBBBBB; -->
<!--     border-left: 0 solid #BBBBBB; -->
<!--     border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%; -->
<!--     transform:translate3d(-75%,-50%,0); -->
<!--     height: 30px; -->
<!--     width:30px; -->
<!--     } -->
<!-- } -->
<!-- </style> -->
<style>
*{margin:0; padding:0;}
a.button{display:inline-block; padding: 10px 20px; text-decoration:none; color:#fff; background:#000; margin:20px;}
#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : gold;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}   
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

<!-- <div class="form"> -->
<!-- <input type="checkbox" id="bubble" value="false"/> -->
<!-- <label class="bubble" for="bubble" ></label> -->
<!-- </div> -->
<div id="wrap">
  <a href="javascript:openModal('modal1');" class="button modal-open">모달열기1</a>
  <a href="javascript:openModal('modal2');" class="button modal-open">모달열기2</a>
</div>

<div id="modal"></div>
  <div class="modal-con modal1">
    <a href="javascript:;" class="close">X</a>
    <p class="title">제목</p>
    <div class="con">
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
    </div>
  </div>

  
   <div class="modal-con modal2">
    <a href="javascript:;" class="close">X</a>
    <p class="title">제목2</p>
    <div class="con">
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
    </div>
  </div>

<script>
function openModal(modalname){
	  document.get
	  $("#modal").fadeIn(300);
	  $("."+modalname).fadeIn(300);
	}

	$("#modal, .close").on('click',function(){
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);
	});     
</script>

</body>
</html>