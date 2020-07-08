<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script src="resources/jquery-1.12.1-ui.js"></script>
<script src="resources/html2canvas.js"></script>
<script type="text/javascript">
   function partShot() { //특정부분 스크린샷 
      html2canvas(document.getElementById("zz")) //id container 부분만 스크린샷 
      .then(function (canvas) { //jpg 결과값
         drawImg(canvas.toDataURL('image/jpeg')); //이미지 저장
         saveAs(canvas.toDataURL(), 'file-name.jpg'); 
         alert("장바구니 담는중")
      })
   } 
   function drawImg(imgData) { 
//       console.log(imgData); //imgData의 결과값을 console 로그롤 보실 수 있습니다. 
      return new Promise(function reslove() { //내가 결과 값을 그릴 canvas 부분 설정 
         var canvas = document.getElementById('canvas'); 
         var ctx = canvas.getContext('2d'); //canvas의 뿌려진 부분 초기화 
         ctx.clearRect(0, 0, canvas.width, canvas.height); 
         var imageObj = new Image(); 
         imageObj.onload = function () { 
            ctx.drawImage(imageObj, 10, 10); //canvas img를 그리겠다. 
         }; 
         imageObj.src = imgData; //그릴 image데이터를 넣어준다. 
      }, function reject() { });
   }
   function saveAs(uri, filename) { 
      alert(filename)
      st=uri.split(",")
      $.ajax({
         url : "makeFile",
         type : "POST",
         data : {imgbase64:st[1]},
         success : function(data) {
            alert(data)
            cartsave(data);
         },
         error : function() {
            alert('문제 발생')
         }
      })
   }
   function cartsave(data) {
      n='${img_name}'
      m='${img_money}'
      $.ajax({
         url : "userimg_insert",
         type : "POST",
         data : {userimg_in:data,imgname:n,imgmoney:m},
         success : function(result) {
            alert(result)
         },
         error : function() {
            alert('장바구니 저장 실패')
         }
      })
   }
   </script>
<script type="text/javascript">
   
//    $(function(){
//        $("#image1").draggable();
//        $("#image2").draggable();
//    })
   
   //기본 이미지 자동생성
   var ch=0;
   var count=1;
   var img=[];
   var ctx=[];
   img[0]=null;
   ctx[0]=null;
//    img[1] = new Image();
//    img[2] = new Image();
      
//     img[1].addEventListener('load',function(){
//       ctx[1] = document.getElementById('myCanvas').getContext("2d");
//         ctx[2] = document.getElementById('myCanvas2').getContext("2d");
//         ctx[1].drawImage(img[1],0,0,300,150);
//         ctx[2].drawImage(img[2],0,0,300,150);
        
//     },false);
      
//     img[1].src="resources/img/right.png";
//     img[2].src="resources/img/abc.jpg";
    
    // 이미지 업로드시 실행되는 함수
    function uploadBtn() {
      $('#file').click();
   }
    // file창이 종료가 되면 실행
   function changeValue(obj){
      var form = $('form')[0];
      var formData = new FormData(form);
      $.ajax({
         url : "fileUpload",
         type : "POST",
         data : formData,
         processData: false,
          contentType: false,
         success : function(result) {
            alert('파일 저장 성공')
         },
         error : function() {
            alert('파일 저장 실패')
         }
      })
      if (obj.files && obj.files[0]) {
         var reader = new FileReader();
         reader.onload = function (e) {
//             alert(e.target.result)
//             alert(obj)
            id="myCanvas"+count
             $('#in').append("<div id='image"+count+"' style='width: 50px; height: 50px;' onclick='imgclick("+count+")'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
            $("#image"+count).draggable();
               img[count] = new Image();
               g=img[count];
               img[count].addEventListener('load',function(){
                 ctx[count] = document.getElementById(id).getContext("2d");
                 ctx[count].drawImage(g,0,0,300,150);
               },false);
               img[count].src=e.target.result;
         }
         reader.readAsDataURL(obj.files[0]);
         count++;
      }
         
   }
    
   function in_text() {
   	alert("in_text")
   	id="myCanvas"+count;
		$('#in').append("<div id='image"+count+"' style='width: 50px; height: 50px;' onclick='imgclick("+count+")'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
		$("#image"+count).draggable();
		ctx[count] = document.getElementById(id).getContext("2d");
		ctx[count].font = '100px Arial';
		ctx[count].fillText('입력', 50, 100);
		count++;
	}
   
    function imgclick(d) {
       ch=d;
       for(i=2;i<count+1;i++){
          $("#image"+i).css("opacity", "1");
       }
       $(function(){
          $("#image"+d).css("opacity", "0.5");
       });
   }
    
   // 디자인하는방법 클릭시 함수 실행
   function opentip() {
       window.name = "parentForm";
       var popupX = (window.screen.width / 2) - (1300 / 2);
       var popupY= (window.screen.height /2) - (850 / 2);
    
       openWin = window.open("tip",
               "logindForm", 'status=no, height=750, width=1300, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
   }
   
   // 내이미지 클릭시 함수 실행
   function mying() {
      window.name = "parentForm";
       var popupX = (window.screen.width / 2) - (1300 / 2);
       var popupY= (window.screen.height /2) - (850 / 2);
       openWin = window.open("myimg",
               "logindForm", 'status=no, height=750, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
   }
   
   function d_fun() {
//       alert($("#op").val()+" 사진 선택")
      id="myCanvas"+count
       $('#in').append("<div id='image"+count+"' style='width: 50px; height: 50px;'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
      $("#image"+count).draggable();
         img[count] = new Image();
         g=img[count]
         img[count].addEventListener('load',function(){
           ctx[count] = document.getElementById(id).getContext("2d");
           ctx[count].drawImage(g,0,0,300,150);
         },false);
         img[count].src=$("#op").val();
         count++
   }
   
   url='${img_name}'
   $(function(){
      $("#zz").css("background-image", "url('resources/img/bag desgin/"+url+".png' )"); 
   });
   
//    좌우 반전
   var left_right_count=0;
   function view_left_right() {
      if(left_right_count%2==0){
          $(function(){
             $("#image"+ch).css("transform", "rotate(90deg)");
             $("#image"+ch).css("-moz-transform", "scaleX(-1)");
             $("#image"+ch).css("-o-transform", "scaleX(-1)");
             $("#image"+ch).css("-webkit-transform", "scaleX(-1)");
             $("#image"+ch).css("transform", "scaleX(-1)");
             $("#image"+ch).css("filter", "FlipH");
             $("#image"+ch).css("-ms-filter", "FlipH");
          });
      }else{
         $(function(){
             $("#image"+ch).css("transform", "rotate(90deg)");
             $("#image"+ch).css("-moz-transform", "scaleX(1)");
             $("#image"+ch).css("-o-transform", "scaleX(1)");
             $("#image"+ch).css("-webkit-transform", "scaleX(1)");
             $("#image"+ch).css("transform", "scaleX(1)");
             $("#image"+ch).css("filter", "FlipH");
             $("#image"+ch).css("-ms-filter", "FlipH");
          });
      }
      left_right_count++;
   }
   
//    위 아래 반전
   var up_down_count=0;
   function view_up_down() {
      if(up_down_count%2==0){
          $(function(){
             $("#image"+ch).css("transform", "rotate(90deg)");
             $("#image"+ch).css("-moz-transform", "scaleY(-1)");
             $("#image"+ch).css("-o-transform", "scaleY(-1)");
             $("#image"+ch).css("-webkit-transform", "scaleY(-1)");
             $("#image"+ch).css("transform", "scaleY(-1)");
             $("#image"+ch).css("filter", "FlipH");
             $("#image"+ch).css("-ms-filter", "FlipH");
          });
      }else{
         $(function(){
             $("#image"+ch).css("transform", "rotate(90deg)");
             $("#image"+ch).css("-moz-transform", "scaleY(1)");
             $("#image"+ch).css("-o-transform", "scaleY(1)");
             $("#image"+ch).css("-webkit-transform", "scaleY(1)");
             $("#image"+ch).css("transform", "scaleY(1)");
             $("#image"+ch).css("filter", "FlipH");
             $("#image"+ch).css("-ms-filter", "FlipH");
          });
      }
      up_down_count++;
   }
   
//    초기화
   function view_reset() {
      window.location.reload();
   }
//    삭제
   function view_garbage() {
      $("div").remove("#image"+ch);
   }
//    상품 수정
   function change() {
      var changeop = document.changeopen;
      
       var popupX = (window.screen.width / 2) - (1300 / 2);
       var popupY= (window.screen.height /2) - (850 / 2);
       openWin = window.open("",
               "changeopen", 'status=no, height=750, width=1100, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY + ", resizable = no, scrollbars = no");    
       changeop.action="change";
       changeop.method="post";
       changeop.target="changeopen";
       changeop.change_val='${img_goods}';
       changeop.submit();
   }
   function background_ch() {
      url=$("#op").val();
      console.log(url);
      $(function(){
         $("#zz").css("background-image", "url('resources/img/desgin/"+url+".png' )"); 
      });
   }
   
//    왼쪽정렬
   function view_left() {
      $("#image"+ch).css("left", "0px");
   }
//    오른쪽 정렬
   function view_right() {
      $("#image"+ch).css("left", "124px");
   }
//    왼쪽,오른쪽 가운데
   function view_left_right_center() {
      $("#image"+ch).css("left", "62px");
   }
//    위,아래 가운데
   function view_up_down_center() {
      $("#image"+ch).css("top", "105px");
   }
//    위쪽정렬
   function view_up() {
      $("#image"+ch).css("top", "0px");
   }
//    아래쪽정렬
   function view_down() {
      $("#image"+ch).css("top", "210px");
   }
   
   //배송안내
   function delivery(){
	   window.open("","delivery","width=700,height=700");
   }
   //청약철회
   function quality(){
	   window.open("","quality","width=700,height=700")
   }
</script>
<body >
   <jsp:include page="../default/header.jsp"/>
   <div style="width: 1500px; margin: 0 auto; margin-top: 100px; ">
      <div style="display: flex; flex-flow:row; width: 700px; margin: 0 auto; " align="left">
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center;">
            <img src="resources/img/reset.png" style="width: 50px;height: 50px;" onclick="view_reset()"><br><font style="font-size: 10px; text-align: center">처음으로</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/previous.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">취소</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/next.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">다시실행</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/garbage.png" style="width: 50px;height: 50px;" onclick="view_garbage()"><br><font style="font-size: 10px;">삭제</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/forward.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">앞으로</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/front.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">뒤로</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/left_right.png" style="width: 50px;height: 50px;" onclick="view_left_right()"><br><font style="font-size: 10px;">좌우반전</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/up_down.png" style="width: 50px;height: 50px;" onclick="view_up_down()"><br><font style="font-size: 10px;">상하반전</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/left.png" style="width: 50px;height: 50px;" onclick="view_left()"><br><font style="font-size: 10px;">왼쪽</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/left_right_center.png" style="width: 50px;height: 50px;" onclick="view_left_right_center()"><br><font style="font-size: 10px;">가운데</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/right.png" style="width: 50px;height: 50px;" onclick="view_right()"><br><font style="font-size: 10px;">오른쪽</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/up.png" style="width: 50px;height: 50px;" onclick="view_up()"><br><font style="font-size: 10px;">위</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/up_down_center.png" style="width: 50px;height: 50px;" onclick="view_up_down_center()"><br><font style="font-size: 10px;">가운데</font>
         </div>
         <div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
            <img src="resources/img/down.png" style="width: 50px;height: 50px;" onclick="view_down()"><br><font style="font-size: 10px;">아래</font>
         </div>
         
      </div>
      <div style="display: flex; flex-flow:row; background-color: #f8f9fa; margin-top: 20px; margin-right: 100px;">
         <div style="width: 250px; margin-top: 50px;" align="center" >
            <div align="center" onclick="partShot()" onmouseover="style='cursor:pointer; width: 200px; height: 70px; background-color: #ffffff; border: 1px solid #eaedf0;'" style="width: 200px; height: 70px;background-color: #ffffff; border: 1px solid #eaedf0;"><p style="padding-top: 7px;"> 장바구니 담기</p> </div><br><br>
            <div style="width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;" align="left" onclick="opentip()" onmouseover="style='cursor:pointer;width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;'">
               <div style="margin-top: 10px;"> <img src="resources/img/tip.png" style="width: 50px; height: 50px;"> </div>
               <div style="text-align: center; margin-top: 10px;"> <p>디자인하는 방법</p> </div>
            </div>
         </div>
         <div style="background-color:green; width: 600px; height: 600px; border: 1px solid #eaedf0;" id="zz">
            <div style="width:174px; height:261px; border: 2px solid black; margin-left: 160px; margin-top: 132px;" id="in">
<!--                <div id="image1" style="width: 50px; height: 50px;"> -->
<!--                   <canvas id="myCanvas" style='width: 50px; height: 50px;'></canvas> -->
<!--                </div> -->
<!--                <div id="image2" style="width: 50px; height: 50px;"> -->
<!--                   <canvas id="myCanvas2" style='width: 50px; height: 50px;'></canvas> -->
<!--                </div> -->
            </div>
         </div>
         <div style="display: flex; flex-flow:column; margin-left: 25px;" align="center">
            <img src="resources/img/change.png" style="width: 100px;height: 100px;" onclick="change()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/upload.png" style="width: 100px;height: 100px;" onclick="uploadBtn()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/myimg.png" style="width: 100px;height: 100px;" onclick="mying()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/text.png" style="width: 100px;height: 100px;" onclick="in_text()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
            <img src="resources/img/design.png" style="width: 100px;height: 100px;" onclick="" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
         </div>
         <div style="float: right; solid:red; height: 500px; margin: 0 auto; margin-left: 50px;">
		상품명<br>
		가격<br><br>
		<button style="border: 1px solid gray; background-color: rgba(0,0,0,0); color: black; padding: 5px;" type="button" onclick="change()"> 상품 변경</button><br>
		<br>
		색상 - 클릭되는 순간 바뀜<br>
		<div style="display: flex; flex: row;">
			<div style="background-color: #fefefe; border: 1px solid gray; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;"></div> 
			<div style="background-color: #ffee49; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;"" ></div> 
			<div style="background-color: #fa733c; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #dc3c78; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #8bdfff; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #8be31b; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #06a132; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #1f5bbc; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div>
		</div>
		<div style="display: flex; flex: row;">
			<div style="background-color: #9d0d1c; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #a5a5aa; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #0a1429; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #080808; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
			<div style="background-color: #f8d6d5; border: 1px solid transparent; width: 30px; height: 30px; border-radius:30px; box-sizing:border-box; cursor:pointer; margin: 5px;""></div> 
		</div>
		<br>
		
		
<!-- 		귀걸이랑 가방은 해당안됨 -->
		사이즈
		<div style="display: flex; flex: row;">
			<ul style="list-style:none; margin:0; padding:0;">
				<li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">S</li>
				<li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">M</li>
				<li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">XL</li>
				<li style="box-sizing: border-box; text-align: center; cursor: pointer; margin-right: 8px; border: solid 1px #d5dbe0; font-size: 14px; color: #000; width: 69px; height: 40px; line-height: 40px; margin-bottom: 8px; list-style: none; float: left;">2XL</li>
			</ul>
		</div>
	</div>
<!-- 	장바구니 -->
<!-- 	<div onclick="partShot()" style="position: absolute; width: 380px; left: 50%; transform: translateX(-50%); height: 56px; font-size: 14px; text-align: center; line-height: 58px; color: #fff; font-weight: 300; background-color: #212529; cursor: pointer; bottom: 100px; margin-left: 520px;" >장바구니 담기</div> -->
      </div>
      
      <!-- 	밑에 글씨들~ -->
<div>
	<div style="padding-top:0; border-top: 0 none; display: block;">
	<p><strong>상품 정보</strong></p>
		<div>
			<p>※모델컷의 경우 촬영장소의 환경에 따라 실제 색상과 상이할 수 있습니다.</p>
			<p>남녀공용<br>도톰한 17수 라운드 티셔츠 입니다.<br>오래입어도 쉽게 모양이 변하지 않는 상품입니다.</p>
			<ul>
				<li>소재 : 면100%</li>
				<li>제조사 : Printstar</li>
				<li>제조국 : Made in China</li>
				<li>사이즈 : S,M,L,XL</li>
				<li>신축성 : 신축성 좋음</li>
				<li>감촉 : 부드러운 감촉</li>
				<li>두께 : 도톰한 소재</li>
			</ul>
			<p><strong>세탁방법</strong></p>
			<ul>
				<li>드라이크리닝 또는 단독 손세탁가능합니다.</li>
				<li>나염/프린트 제품 세탁시 뒤집어 찬물에 세탁하셔야 합니다.</li>
				<li>다리미 사용 시 천을 올린 후 다림질해 주십시오.</li>
			</ul>
			<p><strong>MODEL SIZE</strong></p>
			<ul>
				<li>남자 착용사이즈 화이트 XL, 키 186, 상의 34, 허리 28, 신발 280</li>
				<li>여자 착용사이즈 블랙 M, 키 174, 상의 33.5, 허리 23, 신발 250</li>
			</ul>
			</div>
			<div style="display: none;">
				<div>
			</div>
			<img src="" alt="" />
			<div></div>
			<div "></div>
			</div>
			</div>
			</div>
			<div>
			<div>
			<span><strong>사이즈 정보</strong></span>
			<span></span>
			</div>
			<div>
			<table border="1" style="width:100%; -webkit-tab-hightlight-color: transparent; border-spacing: 2px; letter-spacing: -.1px; table-layout: fixed; border-collapse: collapse; text-align: center; display: table; box-sizing: border-box; border-spacing: 2px; border-color: red/*#e9ecef*/;">
				<tr style="display: table-row; vertical-align: inherit; background-color: #fafafa;">
					<th>Size (cm)</th>
					<th>S</th>
					<th>M</th>
					<th>L</th>
					<th>XL</th>
				</tr>
				<tr>
					<th>총기장</th>
					<td>67</td>
					<td>72</td>
					<td>73</td>
					<td>77</td>
				</tr>
				<tr>
					<th>어깨넓이</th>
					<td>50</td>
					<td>52</td>
					<td>55</td>
					<td>57</td>
				</tr>
				<tr>
					<th>가슴둘레</th>
					<td>55</td>
					<td>58</td>
					<td>62</td>
					<td>65.5</td>
				</tr>
				<tr>
					<th>소매길이</th>
					<td>24</td>
					<td>26</td>
					<td>26.5</td>
					<td>28</td>
				</tr>
			</table>
			<div has_size_info_url="false">
				<ul>
					<li>상세 사이즈는 측정 방법과 위치에 따라 1~3cm 오차가 발생할 수 있습니다. 기재된 상세 사이즈와 실측
        오차(1~3cm)에 대한 불량처리는 어려우며 교환 및 환불 사유가 될 수 없습니다.</li><li>마플에서 판매되는 상품은 각 브랜드, 도매처에서 각각의 샘플링을 거쳐 공급되는 제품이므로, 특정
              브랜드 또는 가지고 계신 상품과 상세 사이즈가 다를 수 있습니다.<br />실측구매 시 상세 사이즈를 반드시 확인 부탁드립니다.
              		</li>
              		<li>사이즈 측정은 상품을 바닥에 펼친 후 끝선과 끝선까지 측정해야하며, 신축성 있는 소재일 경우,
              잡아당기지 않고 바닥에 펼쳐진 상태 그대로 측정해야합니다. 오차범위 이외 잘못된 측정으로 인한
              반품 및 교환은 어려운 점 양해 부탁드립니다.
              		</li>
              	</ul>
            </div>
            </div>
            </div>
            <div
            is_open="true"
            style="display: none;">
            <div>
            <span>사이즈 비교</span>
            <span></span>
            </div>
            <div>
            </div>
            </div>
            <div is_open="true">
            <div>
            <span>인쇄 관련 사항</span>
            </div>
            <div>
            <div>
            <div>
            <img src="" alt=""/>
      <img src="" alt="" />
      </div>
      <h2>주의사항</h2>
      	<ul>
      		<li>배경이 투명한 PNG의 경우, CMYK 색상모드로 웹용(Save for Web) 저장해주세요.<br />배경이 꽉 찬 JPG의
        경우, RGB 색상모드로 저장해주세요.<br />이미지 크기는 최소 2500~3500px / 해상도는 150dpi 이상으로
        제작해주세요.</li><li>상품마다 이미지 크기가 다르므로, 해당 상품의 이미지 가이드를 확인해 주세요.
        	</li>
        	<li>작은 원본 이미지를 사이즈 규격에 맞게 임의로 크게 확대할 경우 인쇄 시 화질이 깨질 수 있습니다.
        	</li>
        	<li>상품 실측 사이즈를 반드시 확인해 주세요.
        	</li>
        	<li>인쇄를 원하시는 위치가 있을 시 [상품 제작 요청사항]에 남겨주시거나, 1:1 상담 또는
        고객센터(help@marpple.com)로 메일 주세요. 따로 위치 지정 요청이 없으면 가장 보편적인 위치로
        인쇄해드립니다.
        	</li><li>모니터, 핸드폰에 따라 실제 인쇄 색상과 다르게 보일 수 있습니다.
        	</li>
        </ul>
        <h2>교환/환불 불가 사항</h2>
        <p>마플의 모든 상품은 고객 주문에 따라 개별 제작되는 방식으로 단순 변심을 포함, 아래의 경우에는 교환 /
      환불이 불가합니다.</p>
      <h3>- 디자인 시안 색상의 차이</h3><p class="txt2">프린팅 방식과 원단 재질에 따른 경우의 수가 다양하므로 인쇄 후 모니터, 혹은 종이 출력물과 색상 차이가
      발생할 수 있습니다.</p>
      <h3>- 인쇄 위치 및 크기의 차이</h3>
      <p>제품 재질에 따른 특성의 차이와 대부분의 인쇄가 수작업으로 이루어진다는 점에서 시안과 실제 상품의 인쇄
      위치 및 크기의 오차가 발생할 수 있습니다. 인쇄 위치 및 크기를 별도로 [요청] 하지 않은 주문건에 대한 교환
      또는 환불은 불가합니다.</p>
      <h3>- 추가 주문 시 기존 상품 색상과의 컬러 차이</h3>
      <p >상품 컬러 및 사이즈는 제작 시기별, 생산시즌별로 원단 컬러와 사이즈 차이가 발생할 수 있습니다.</p><h3>- 화학 제품 사용으로 인한 손상</h3><p class="txt2">우레탄 전사(PU Heat Transfer) 인쇄 제품에 솔벤트와 같은 용해력이 있는 용매를 사용한 향수를 직접적으로
      분사할 경우 인쇄 부분이 손상될 수 있으니 주의해주세요.</p>
      <h2>교환/환불 기간</h2>
      <p>물품에 문제 되는 사항에 대해서는 수령 후 7일 이내 이메일
      <a href="guddn108@naver.com">guddn108@naver.com</a>
      또는 고객센터로 연락주셔야 가능합니다.</p>
      <p>★ 주문 완료 후 상품 및 이미지 변경을 원하실 경우 [제작준비중] 상태에서만 변경이 가능하며 [제작중]에는
      변경 및 취소가 불가합니다. 변경을 원하시는 경우 1:1 상담 및 카톡 또는 고객센터(<a href="tel:1566-9437">1566-9437</a>)를 통해 문의 바랍니다.</p></div></div></div><div class="toggle_cont tg_faq" is_open="false"><div class="tg_head"><span class="tit">자주 묻는 질문</span><span class="btn"></span></div><div class="tg_body"><div class="faq_area"><ul><li><div class="q">저작권이 있는 이미지 사용이 가능한가요?</div><div class="a">마플은 모든 저작권자를 존중합니다. 이미지의 저작권자 또는 원작자가 공공으로 쓸 수 있는 이미지라고
          명시했거나, 저작권이 만료된 이미지에 한해 사용이 가능합니다.
          </div>
          </li>
          <li>
          <div>원하는 디자인을 의뢰할 수 있나요?
          </div>
          <div >마플은 고객 맞춤 디자인을 제공하지 않습니다.<br />단, 업로드 한 이미지의 배경 제거 및 로고 컬러 수정 등 원활한 인쇄 작업을 위한 간단한 수정만
          제공합니다.
          </div>
          </li>
          <li>
          <div >배경 제거가 가능한가요?
          </div>
          <div >가능합니다. 주문 시 [배경 지우기] 요청에 체크 후 주문해주세요.<br />배경 제거가 불가한 경우 별도로
          연락드립니다.
          </div>
          </li>
          <li>
          <div >인쇄 가능한 영역을 벗어났다는 메시지가 확인됩니다.
          </div>
          <div>올려주신 이미지 또는 텍스트가 인쇄 영역보다 크게 삽입되었을 경우 팝업 되는 메시지입니다.<br />이미지 또는 텍스트 크기를 줄여서 인쇄 영역 안으로 이미지를 조정해주세요.
          </div>
          </li>
          <li>
          <div>AI나 PSD 파일로 제작할 수 있나요?
          </div>
          <div >가능합니다. 주문 후 원본 파일을<a href="guddn108@naver.com">guddn108@naver.com</a>으로
          전송해주시면 원본 파일로 보다 깔끔한 제작이 가능합니다.
          </div>
          </li>
          <li>
          <div>자수로 제작하고 싶어요.
          </div>
          <div >자수의 경우 주문 시 [상품 제작 요청사항] 메모를 남겨 주시면, 디자인 검토 후 가능 여부를 알려드리며,
          추가 비용이 발생할 수 있습니다.
     </span>
    
          
<!--     여기까지 -->
	<div border="1" style="width: 992px; margin: 70px auto 50px; text-align: center; display: block; font-size: 14px;">
		<input type="button" value="배송안내" onclick="window.open('delivery','배송안내','width=900,height=700')" style="width: 300px; height: 50px; margin-right: 100px;">
		<input type="button" value="품질보증/청약철회 안내" onclick="window.open('quality','배송안내','width=900,height=700')" style="width: 300px; height: 50px; margin-right: 80px;">
	</div>
      
   </div>
   <form id="form">
   <input type="file" id="file" name="file" onchange="changeValue(this)" style="display:none; "/>
   </form>
   <!-- 일부분 부분-->
   <!-- 결과화면을 그려줄 canvas -->
   <canvas id="canvas" width="900" height="600"
      style="border: 1px solid #d3d3d3; display:none;">
   </canvas>
   <input type="hidden" id="op" value="">
   <form name="changeopen">
      <input type="hidden" name="change_val">
   </form>
   <jsp:include page="../default/footer.jsp"/>
</body>
</html>