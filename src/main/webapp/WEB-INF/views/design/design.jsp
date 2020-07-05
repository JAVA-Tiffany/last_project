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
// 		console.log(imgData); //imgData의 결과값을 console 로그롤 보실 수 있습니다. 
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
	var count=1
	$(function(){
	    $("#image1").draggable();
	    $("#image2").draggable();
	})
	
	//기본 이미지 자동생성
	var img=[]
	var ctx=[]
	img[0]=null;
	ctx[0]=null;
// 	img[1] = new Image();
// 	img[2] = new Image();
      
//     img[1].addEventListener('load',function(){
// 		ctx[1] = document.getElementById('myCanvas').getContext("2d");
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
				alert(e.target.result)
				alert(obj)
				id="myCanvas"+count
			    $('#in').append("<div id='image"+count+"' style='width: 50px; height: 50px;'><canvas id='myCanvas"+count+"'style='width: 50px; height: 50px;'></canvas></div>")
				$("#image"+count).draggable();
			   	img[count] = new Image();
			   	g=img[count]
			   	img[count].addEventListener('load',function(){
			     	ctx[count] = document.getElementById(id).getContext("2d");
			     	ctx[count].drawImage(g,0,0,300,150);
			   	},false);
			   	img[count].src=e.target.result;
			}
			reader.readAsDataURL(obj.files[0]);
		}
	   	count++
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
		alert($("#op").val()+" 사진 선택")
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
		$("#zz").css("background-image", "url('resources/img/desgin/"+url+".png' )"); 
	});
</script>
<body >
	<jsp:include page="../default/header.jsp"/>
	<div style="width: 900px; margin: 0 auto; margin-top: 100px;">
		<div style="display: flex; flex-flow:low; width: 700px; margin: 0 auto;" align="left">
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center;">
				<img src="resources/img/reset.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px; text-align: center">처음으로</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/previous.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">취소</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/next.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">다시실행</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/garbage.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">삭제</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/forward.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">앞으로</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/front.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">뒤로</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/left_right.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">좌우반전</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/up_down.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">상하반전</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/left.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">왼쪽</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/left_right_center.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">가운데</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/right.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">오른쪽</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/up.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">위</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/up_down_center.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">가운데</font>
			</div>
			<div onmouseover="style='cursor:pointer;text-align: center;'" style="text-align: center">
				<img src="resources/img/down.png" style="width: 50px;height: 50px;" onclick=""><br><font style="font-size: 10px;">아래</font>
			</div>
			
		</div>
		<div style="display: flex; flex-flow:low; background-color: #f8f9fa; margin-top: 20px;">
			<div style="width: 250px; margin-top: 50px;" align="center" >
				<div align="center" onclick="partShot()" onmouseover="style='cursor:pointer; width: 200px; height: 70px; background-color: #ffffff; border: 1px solid #eaedf0;'" style="width: 200px; height: 70px;background-color: #ffffff; border: 1px solid #eaedf0;"><p style="padding-top: 7px;"> 장바구니 담기</p> </div><br><br>
				<div style="width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;" align="left" onclick="opentip()" onmouseover="style='cursor:pointer;width: 200px; height:70px; background-color: #ffffff; display: flex; flex-flow:low; border: 1px solid #eaedf0;'">
					<div style="margin-top: 10px;"> <img src="resources/img/tip.png" style="width: 50px; height: 50px;"> </div>
					<div style="text-align: center; margin-top: 10px;"> <p>디자인하는 방법</p> </div>
				</div>
			</div>
			<div style="width: 500px; height: 500px; border: 1px solid #eaedf0;" id="zz">
				<div style="width:174px; height:261px; border: 2px solid black; margin-left: 160px; margin-top: 132px;" id="in">
<!-- 					<div id="image1" style="width: 50px; height: 50px;"> -->
<!-- 						<canvas id="myCanvas" style='width: 50px; height: 50px;'></canvas> -->
<!-- 					</div> -->
<!-- 					<div id="image2" style="width: 50px; height: 50px;"> -->
<!-- 						<canvas id="myCanvas2" style='width: 50px; height: 50px;'></canvas> -->
<!-- 					</div> -->
				</div>
			</div>
			<div style="display: flex; flex-flow:column; margin-left: 25px;" align="center">
				<img src="resources/img/change.png" style="width: 100px;height: 100px;" onclick="" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
				<img src="resources/img/upload.png" style="width: 100px;height: 100px;" onclick="uploadBtn()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
				<img src="resources/img/myimg.png" style="width: 100px;height: 100px;" onclick="mying()" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
				<img src="resources/img/text.png" style="width: 100px;height: 100px;" onclick="" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
				<img src="resources/img/design.png" style="width: 100px;height: 100px;" onclick="" onmouseover="style='cursor:pointer;width: 100px;height: 100px;'">
			</div>
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
</body>
</html>