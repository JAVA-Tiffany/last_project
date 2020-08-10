<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/plugins/images/favicon.png">
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="resources/adbootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="resources/plugins/bower_components/toast-master/css/jquery.toast.css?a" rel="stylesheet">
    <!-- morris CSS -->
    <link href="resources/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- chartist CSS -->
<!--     <link href="resources/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet"> -->
<!--     <link href="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet"> -->
    <!-- animation CSS -->
    <link href="resources/adcss/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="resources/adcss/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="resources/adcss/colors/default.css" id="theme" rel="stylesheet">
<title>재고관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
/*    padding-top: 200px; */
/*    padding-bottom: 100px; */
   }
   .div2{
   padding-top: 40px;
   }
</style>
</head>

<body class="fix-header">
<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
</c:if>
<script type="text/javascript">

$(document).ready(function() {
   index =0;
   $(".Modifybtn1").click(function(){ 
      index = $(this).closest('tr').prevAll().length-1; 
      console.log('trNum : ' + index);
      
        var str = ""
        var tdArr = new Array();    // 배열 선언
        var Modifybtn1 = $(this);

        var tr = Modifybtn1.parent().parent();
        var td = tr.children();
       
       var quantity = document.getElementsByClassName("quantityData")[index].value;
       console.log(quantity)
          var type= td.eq(2).text();
        var no = td.eq(3).text();
        
        $.ajax({
            url: "modifyQuantity",
            type: "POST",
            data: {quantity:quantity,product:no,type:type},
            success: function(data){
                reloadList();
            },
            error: function(){
                alert("error");
            }
     
        });
    });
   
   $("#category").change(function(){ 
      var choice = document.getElementById("category").value
      console.log(choice)
        location.href="categorySelect?choice="+choice;
    
       });
   
   
   $("#AddProduct").click(function(){
      
      var _width = '600';
       var _height = '400';
    
       // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
       var _left = Math.ceil(( window.screen.width - _width )/2);
       var _top = Math.ceil(( window.screen.height - _height )/2); 
    
       window.open('AddProductPopup', '상품등록', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top ,'location=no');

      
      
   });
   
   $(".Deletebtn1").click(function(){ 
            var str = ""
         var tdArr = new Array();   // 배열 선언
         var checkBtn = $(this);
         
         // checkBtn.parent() : checkBtn의 부모는 <td>이다.
         // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
         var tr = checkBtn.parent().parent();
         var td = tr.children();
         
         console.log("클릭한 Row의 모든 데이터 : "+tr.text());
         
         var product = td.eq(3).text();
         
         Swal.fire({
              title: '상품을 삭제하시겠습니까?',
              text: '선택하신 상품 : '+product+' 을 정말 삭제하시겠습니까?',
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!'
         }).then((result) => {
              if (result.value) {
                Swal.fire({
                   title:'Deleted!',
                   text: '성공적으로 삭제되었습니다!',
                   icon: 'success',
                  preConfirm:function(){
                     $.ajax({
                          url: "DelProduct",
                          type: "POST",
                          data: {product:product},
                          success: function(data){
                              reloadList();
                          },
                          error: function(){
                              alert("error");
                          }
                   
                      });
                   }
                })
              }
            })
      });
});
   
   function reloadList(){
      location.reload();
   }
   function ad(d) {
      $("form[name=adminHeader_form]").attr("action",d);
      adminHeader_form.submit();
   }
   
</script>

    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a href="index" style="color: black;">
                     <img class="img1" src="resources/img/MAKE1.PNG" style="width:200px; height: 69PX; color:#F6F6F6;">
                 </a>  
                </div>
                <!-- /Logo -->
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg" href="javascript:void(0)"><i class="fa fa-bars"></i></a>
                    </li>
                    <li>
                        <a class="profile-pic" href="#"> <img src="https://image.flaticon.com/icons/png/512/1421/1421222.png" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${sessionScope.id }</b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 70px 0 0;">
                        <a href="adminindex" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>관리자 메인</a>
                    </li>
                    <li>
                        <a href="acsearch" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>계정 관리</a>
                    </li>
                    <li>
                        <a href="acboard" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>Q & A 관리</a>
                    </li>
                    <li>
                        <a href="acnotice" class="waves-effect"><i class="fa fa-table fa-fw" aria-hidden="true"></i>공지사항 관리</a>
                    </li>
                    <li>
                        <a href="QuantityManage" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>재고 관리</a>
                    </li>
                    <li>
                        <a href="javascript:ad('accart');" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>구매내역 관리</a>
                    </li>
                    <li>
                        <a href="index" class="waves-effect"><i class="fa fa-columns fa-fw" aria-hidden="true"></i>메인으로 나가기</a>
                    </li>

                </ul>
                
            </div>
            
        </div>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">admin page</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title">PRODUCT MANAGE</h3>
<!-- 여기서 부터 내용 -->
               <div><input type="button" id="AddProduct" value="상품등록"></div>

<div align="center" class="div1">
   <table border="1" class="table" id="thetable">
         <tr>
            <th style="width: 3%;"></th>
            <th>이미지</th>
            <th style="width: 50%;padding-left: 200px;">제목
            <div align="right" style="float:right;">
         <select name="category" id="category">
            <option>카테고리를 선택해주세요</option>
            <option value="All">전체 목록</option>
            <option value="bag">가방</option>
            <option value="dress">의류</option>
            <option value="earring">귀걸이/귀찌</option>
            <option value="phon">폰케이스</option>
         </select>
         </div>
            </th>
            <th style="width: 10%;">가격</th>
            <th style="width: 10%;">재고</th>
            <th style="width: 10%;">재고수정</th>
            <th style="width: 10%;">수정</th>
         </tr>
   <c:forEach var="datalist" items="${PickData}">
      <tr>
         <td><input type="checkbox" name="checkBtn"></td>
         <td><img src="${datalist.img }" style="width:150px;height:100px;"></td>
         <td style="display:none;">${datalist.type }</td>
         <td align="center">${datalist.product }</td>
         <td>${datalist.price }</td>
         <td>${datalist.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn1" value="수정"/><input type="button" class="Deletebtn1" value="삭제"/></td>
      </tr>
      </c:forEach>
   <c:forEach var="datalist" items="${datalist}">
      <tr>
         <td><input type="checkbox" name="checkBtn"></td>
         <td><img src="${datalist.img }" style="width:150px;height:100px;"></td>
         <td style="display:none;">${datalist.type }</td>
         <td>${datalist.product }</td>
         <td>${datalist.price }</td>
         <td>${datalist.quantity }</td>
         <td><input type="text" class="quantityData" placeholder="재고수정"></td>
         <td><input type="button" class="Modifybtn1" value="수정"/><input type="button" class="Deletebtn1" value="삭제"/></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5" style="text-align: center;">
            <button type="button" id="Delbutton">글삭제</button>
         </td>
      </tr>
   </table>
</div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="resources/adbootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="resources/adjs/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="resources/adjs/waves.js"></script>
    <!--Counter js -->
    <script src="resources/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
    <script src="resources/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
    <!-- chartist chart -->
    <script src="resources/plugins/bower_components/chartist-js/dist/chartist.min.js"></script>
    <script src="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!-- Sparkline chart JavaScript -->
    <script src="resources/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="resources/adjs/custom.min.js"></script>
    <script src="resources/adjs/dashboard1.js"></script>
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js?a"></script>

   <form name="adminHeader_form" method="post">
   <input type="hidden" id="adminHeader_form_start" name="start" value="1">
   <input type="hidden" id="adminHeader_form_end" name="end" value="10">
   </form>
</body>
</html>