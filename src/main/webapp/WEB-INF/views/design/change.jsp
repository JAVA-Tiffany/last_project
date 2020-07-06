<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
<style>
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
</head>
<body>
   

<!--    top버튼 -->
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


   <script src="resources/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
      var size= ${list_img.size()}
      function number_click(age) {
         sessionStorage.setItem("last", 9*age);
         sessionStorage.setItem("start", sessionStorage.getItem("last")-9);
      }
      if(size>9){
         $(function (){
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><<</a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><</a></div> ");
            for(i=0;i<size/9;i++){
               $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' onclick='number_click("+(i+1)+")' style='text-decoration: none;' id='a"+(i+1)+"'>"+(i+1)+"</a></div>");
            };
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>></a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>>></a></div>");
         });
      }else{
         $(function (){
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><<</a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'><</a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>1</a></div>");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>></a></div> ");
            $('#num').append("<div style='margin: 0 auto;border: 1px solid #555; text-decoration: none; width: 30px; height: 20px;'><a href='' style='text-decoration: none;'>>></a></div>");
         });
      }
      
		$(function () {
        	if(sessionStorage.getItem("last")==null){
            	sessionStorage.setItem("last", 9);
            	sessionStorage.setItem("start", 0);
            }
            c=0
            a=0
            l=${list_img}
            r=${list_product}
            u=${list_price}
        	z=${list_count}
		for(i=0;i<size;i++){
            s=l[i]   //이미지
            p=r[i]   //상품이름
            uu=u[i]   //가격
            zz=z[i]   //리뷰
			if(i<sessionStorage.getItem("last") && i>=sessionStorage.getItem("start")){
                a++;
                if(i%3==0) {
                   c++;
                   $('#table').append("<tr style='height:500px' id='tr"+c+"'></tr>");
                }
                $("#tr"+c).append("<td>"
                +"<img onmouseleave=style='width:312px;height:390px;margin-left:10px;' onmouseover=style='width:312px;height:390px;margin-left:10px;opacity:0.5;' style='width: 312px; height: 390px; margin-left: 10px;' src='"+s+"' onclick='imgin("+a+")'>"
                    +"<p align='center' style='margin-top: 5px; font-family:궁서체;' id='imgname"+a+"'>"+p+"</p> "
                	+"<p align='center' style='margin-top: 5px; font-family:궁서체;' id='imgmoney"+a+"'>"+"가격 : &nbsp;"+uu+"</p>"
                	+"<p align='center' style='margin-top: 5px; color:gray;' >"+"리뷰 : &nbsp;"+zz+"</p>"
                	+"</td>");
             
            	}
			}
		});
	function imgin(z) {
		ur=$("#imgname"+z).text();
		$(opener.document).find("#op").val(ur);
		$(opener.location).attr("href", "javascript:background_ch();");
		window.close();
    }
	var goods_list_count=0;
	function goods_list_click() {
		if(goods_list_count%2==0){
			bag="bag";
			dress="dress";
			earring="earring";
			$("#goods_list").append("<div id='delch'> <label onclick='addchange("+bag+")' onmouseover=style='cursor:pointer;'>가방</label> &nbsp;&nbsp;"
					+"<label onclick='addchange("+dress+")' onmouseover=style='cursor:pointer;'>옷</label> &nbsp;&nbsp; "
					+"<label onclick='addchange("+earring+")' onmouseover=style='cursor:pointer;'>귀걸이</label> </div>");
		}else{
			$("div").remove("#delch");
		}
		goods_list_count++;
	}
	function addchange(d) {
		$("#add").val(d);
		addch.submit();
	}
	</script>
	
   
	<div align="center">
		<div onmouseover="style='cursor:pointer; margin-top: 30px;'" style="margin-top: 30px;" onclick="goods_list_click()" id="goods_list">
			기타 액세사리 ↓
		</div>
		<div style="margin-top: 50px;">
			<table id="table"></table>
		</div>
		<div id="num" style="display: flex; flex-flow:low; width: 600px;">
		</div>
	</div>
	<!-- top버튼 -->
	<a id="backToTop" class="scrolltop" href="#">
	      <i class="fas fa-chevron-circle-up"></i>
	</a>
	<label onclick=""></label>
	<form action="change" method="post" name="addch">
		<input type="hidden" name="change_val" id="add">
	</form>
</body>
</html>