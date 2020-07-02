<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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
         number=0
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
//                alert("i : "+i+", last : "+sessionStorage.getItem("last")+", start : "+sessionStorage.getItem("start"))
               if(i%3==0) {
                  c++;
                  $('#table').append("<tr style='height:500px' id='tr"+c+"'></tr>");
               }
               $("#tr"+c).append("<td> <img onmouseleave=style='width:312px;height:390px;margin-left:10px;' onmouseover=style='width:312px;height:390px;margin-left:10px;opacity:0.5'"+
                     " style='width: 312px; height: 390px; margin-left: 10px;' src='"+s+"' onclick=location.href='design'> <p align='center' style='margin-top: 5px; font-family:궁서체;'>"+p+"</p> <p align='center' style='margin-top: 5px; font-family:궁서체;'>"+"가격 : &nbsp;"+uu+"</p> <p align='center' style='margin-top: 5px; color:gray;' >"+"리뷰 : &nbsp;"+zz+"</p></td>");
            }
            number++;
         }
      });

   </script>
<%@include file="header.jsp" %>
   <div align="center">
      <div style="margin-top: 150px;">
         <table id="table"></table>
      </div>
      <div id="num" style="display: flex; flex-flow:low; width: 600px;">
      </div>
   </div>
<%@include file="footer.jsp" %>
</body>
</html>