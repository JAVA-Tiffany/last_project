<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>google chart</title>
</head>
 
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
</head>
<body>
  <!-- chart�� ������ ���� -->
  <div id="bar_chart_div"></div>
</body>
<script>
google.charts.load('current', {'packages':['bar','corechart']});

function schedulerSuccessAndFailChart() {
    var data = google.visualization.arrayToDataTable([
           ["Title","����", {role:'annotation'}, "����", {role:'annotation'}],
                    [""
            ,413, 413 //����������
            ,24, 24] //���е�����
   ]);

   var barChartOption = {
           bars: 'vertical',
           height :260,
           width :'100%',
           legend: { position: "top" },
           isStacked: false,
           tooltip:{textStyle : {fontSize:12}, showColorCode : true},
           animation: { //��Ʈ�� �ѷ����� ����� �ִϸ��̼� ȿ��
             startup: true,
             duration: 1000,
             easing: 'linear' },
           annotations: {
               textStyle: {
                 fontSize: 15,
                 bold: true,
                 italic: true,
                 color: '#871b47',
                 auraColor: '#d799ae',
                 opacity: 0.8
               }
          }
    };

   var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));

   chart.draw(data, barChartOption);
   //������ �׷��� ��� - ������ �׷����� ������ ���� �� �����ϰų� �ּ�ó�� �ϼ���.
   window.addEventListener('resize', function() { chart.draw(data, barChartOption); }, false);
}

google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);



</script>
</html>