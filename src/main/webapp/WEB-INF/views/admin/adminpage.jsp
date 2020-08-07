<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#chart {
   display: flex;
   justify-content: center; /*가로에서 가운데에 요소(자식요소)를 배치하겠다*/
   align-items: center; /* 세로에서 가운데에 요소를 배치하겠다 */
}
.wi{width: 140px;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.div1 {
padding-top: 50px;
padding-bottom: 100px;

}
.div1 a:hover {
color:red; background-color: black;
}

body {
   font: 400 14px 'Poppins',sans-serif;
}


a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
   color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color:red; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->


</style>
<!-- <link rel="stylesheet" type="text/css" -->
<!--    href="resources/css/main.css?after"> -->
</head>
<body>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
</c:if>

<jsp:include page="AdminHeader.jsp"/>

<div align="center" class="div1">
<div class="div2" style=" text-align: center;" >
<!-- 예제 시작 -->

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
   google.charts.load('current', {packages:['corechart']});
</script>
<!-- 차트 내용 -->
<div style="display: flex; flex: row;" id="chart">
	<div align="center" style="margin-right: 100px;">
		<div id="chart_div"></div>
		<div id="chart_div_to"></div>
	</div>
	<div>
		<table border="1" style="width: 700px; height: 500px;">
			<tr style="background-color: #66666694;">
				<th class="wi"></th><th class="wi">귀걸이</th><th class="wi">가방</th><th class="wi">옷</th><th class="wi">폰</th><th class="wi">총합</th>
			</tr>
			<tr>
				<th>1월</th><th>${chart1mon.split(",")[0]}</th><th>${chart1mon.split(",")[1]}</th><th>${chart1mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart1mont}</th>
			</tr>
			<tr>
				<th>2월</th><th>${chart2mon.split(",")[0]}</th><th>${chart2mon.split(",")[1]}</th><th>${chart2mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart2mont}</th>
			</tr>
			<tr>
				<th>3월</th><th>${chart3mon.split(",")[0]}</th><th>${chart3mon.split(",")[1]}</th><th>${chart3mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart3mont}</th>
			</tr>
			<tr>
				<th>4월</th><th>${chart4mon.split(",")[0]}</th><th>${chart4mon.split(",")[1]}</th><th>${chart4mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart4mont}</th>
			</tr>
			<tr>
				<th>5월</th><th>${chart5mon.split(",")[0]}</th><th>${chart5mon.split(",")[1]}</th><th>${chart5mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart5mont}</th>
			</tr>
			<tr>
				<th>6월</th><th>${chart6mon.split(",")[0]}</th><th>${chart6mon.split(",")[1]}</th><th>${chart6mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart6mont}</th>
			</tr>
			<tr>
				<th>7월</th><th>${chart7mon.split(",")[0]}</th><th>${chart7mon.split(",")[1]}</th><th>${chart7mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart7mont}</th>
			</tr>
			<tr>
				<th>8월</th><th>${chart8mon.split(",")[0]}</th><th>${chart8mon.split(",")[1]}</th><th>${chart8mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart8mont}</th>
			</tr>
			<tr>
				<th>9월</th><th>${chart9mon.split(",")[0]}</th><th>${chart9mon.split(",")[1]}</th><th>${chart9mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart9mont}</th>
			</tr>
			<tr>
				<th>10월</th><th>${chart10mon.split(",")[0]}</th><th>${chart10mon.split(",")[1]}</th><th>${chart10mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart10mont}</th>
			</tr>
			<tr>
				<th>11월</th><th>${chart11mon.split(",")[0]}</th><th>${chart11mon.split(",")[1]}</th><th>${chart11mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart11mont}</th>
			</tr>
			<tr>
				<th>12월</th><th>${chart12mon.split(",")[0]}</th><th>${chart12mon.split(",")[1]}</th><th>${chart12mon.split(",")[2]}</th><th>${chart1mon.split(",")[3]}</th><th>${chart12mont}</th>
			</tr>
		</table>
	</div>
</div>

<%-- <label id="c1">${yer}</label> --%>

<!-- 차트 년도 변경 -->
<div style="text-align:center;">
<input type="text" onchange="yerch()" id="chart_date" placeholder="년도 입력" style="text-align: center;">
<form action="adminpage" name="chart_form" method="post">
${chart_date}
<input type="hidden" id="chart_text" name="yer">
</form>
</div>
<!-- 차트 유형 변경 -->
<!-- <div style="text-align:center; padding-top: 50px;"> -->
<!--    <button type="button" onclick="chart_options.isStacked=false; drawChart()">false(기본값)</button> -->
<!--    <button type="button" onclick="chart_options.isStacked=true; drawChart()">true</button> -->
<!-- </div> -->
<script>

// 로딩 완료시 함수 실행하여 차트 생성
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart_to);

// 차트 옵션을 전역으로 설정했습니다. 설정을 바꿔보는 예제를 만들기 위해서요.
var chart_options = {
   title : ${yer}+'년 월 매출',
   width : 700,
   height : 300,
   tooltip:{textStyle : {fontSize:12}, showColorCode : true},
   bar : {
      groupWidth : '50%' // 예제에서 이 값을 수정
   },
   seriesType : 'bars',
   isStacked : false, // 그래프 쌓기(스택), 기본값은 false
   animation: { //차트가 뿌려질때 실행될 애니메이션 효과
        startup: true,
        duration: 1000,
        easing: 'linear' }
};


function drawChart(){
   // 차트 데이터
   
   var data = new google.visualization.arrayToDataTable([
      ['월', '귀걸이', '가방', '옷','폰'], // 제목 그리고 항목들

      ['1월', ${chart1mon}], // 제목과 항목수를 맞춰주어야 합니다.
      ['2월', ${chart2mon}], // 마지막 값들은 라인그래프를 만들때 사용합니다.
      ['3월', ${chart3mon}],
      ['4월', ${chart4mon}],
      ['5월', ${chart5mon}],
      ['6월', ${chart6mon}],
      ['7월', ${chart7mon}],
      ['8월', ${chart8mon}],
      ['9월', ${chart9mon}],
      ['10월', ${chart10mon}],
      ['11월', ${chart11mon}],
      ['12월', ${chart12mon}]
   ]);
   
   var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
   chart.draw(data, chart_options);
}

//차트 옵션을 전역으로 설정했습니다. 설정을 바꿔보는 예제를 만들기 위해서요.
var chart_options_to = {
title : ${yer}+'년 월 매출',
width : 700,
height : 300,
tooltip:{textStyle : {fontSize:12}, showColorCode : true},
bar : {
   groupWidth : '50%' // 예제에서 이 값을 수정
},
seriesType : 'line',
isStacked : false, // 그래프 쌓기(스택), 기본값은 false
animation: { //차트가 뿌려질때 실행될 애니메이션 효과
     startup: true,
     duration: 1000,
     easing: 'linear' }
};


function drawChart_to(){
// 차트 데이터

var data = new google.visualization.arrayToDataTable([
   ['월', '총합'], // 제목 그리고 항목들

   ['1월', ${chart1mont}], // 제목과 항목수를 맞춰주어야 합니다.
   ['2월', ${chart2mont}], // 마지막 값들은 라인그래프를 만들때 사용합니다.
   ['3월', ${chart3mont}],
   ['4월', ${chart4mont}],
   ['5월', ${chart5mont}],
   ['6월', ${chart6mont}],
   ['7월', ${chart7mont}],
   ['8월', ${chart8mont}],
   ['9월', ${chart9mont}],
   ['10월', ${chart10mont}],
   ['11월', ${chart11mont}],
   ['12월', ${chart12mont}]
]);

var chart = new google.visualization.ComboChart(document.getElementById('chart_div_to'));
chart.draw(data, chart_options_to);
}

</script>

<!-- 예제 종료 -->
<script type="text/javascript">
function yerch() {
   alert($("#chart_date").val());
   $("#chart_text").val($("#chart_date").val());
//    $("#c1").text($("#chart_date").val().split("-")[0]);
   chart_form.submit();
}
</script>

</div>
</div>



 <jsp:include page="../default/footer.jsp"/>
</body>
</html>