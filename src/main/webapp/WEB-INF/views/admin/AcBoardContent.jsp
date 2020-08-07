<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!--     <link href="resources/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet"> -->
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
<title>Insert title here</title>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script type="text/javascript">
   var comment_count=0;
   size = ${comment_view.size()};
   writer_view = ${writer_view};
   comment_view = ${comment_view};
   regDate_view = ${regDate_view};
   rno=${rno_view};
   bno_view=${bno_view};
   $(function() {
      for(i=0;i<size;i++){
         $("#comment_list").append("<div id='canc"+comment_count+"' style='margin-top:20px; width:60%; '> 작성자 &nbsp; : &nbsp;<label id='comment_writer"+comment_count+"'>"+writer_view[i]+"</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성시간 &nbsp;:&nbsp;"+regDate_view[i]+""
               +"<br><textarea id='commare"+comment_count+"' cols='1' style='width:420px;height:100px; margin-top:10px; resize: none;' name='comment_contents'> "+comment_view[i]+"</textarea> </div>");
         $("#comment_list").append("<input id='btn_del"+comment_count+"' type='button' value='댓글 삭제' onclick='reply_del("+comment_count+")'>");
         $("#comment_list").append("<input id='btn_change"+comment_count+"' type='button' value='댓글 수정' onclick='reply_ch("+comment_count+")'>");
         $("#comment_list").append("<input id='btn_change_cel"+comment_count+"' style='display: none' type='button' value='댓글 수정 취소' onclick='reply_ch_cel("+comment_count+")'>");
         $("#comment_list").append("<input type='hidden' id='bno_out"+comment_count+"' value='"+bno_view+"'>")
         $("#comment_list").append("<input type='hidden' id='rno_out"+comment_count+"' value='"+rno[i]+"'>");
         $("#commare"+comment_count).attr('disabled', true);
         comment_count++;
      }
   })
   function comment() {
      if($("#comment_btn").val()=='댓글'){
         $("#commare"+comment_count).attr('disabled', false);
         $("#comment_btn").val("등록");
         $("#comment_list").append("<div id='canc"+comment_count+"' style='margin-top:20px; width:60%; '> 작성자 &nbsp; : &nbsp;<label id='comment_writer"+comment_count+"'>${id}</label>"
               +"<br><textarea id='commare"+comment_count+"' cols='1' style='width:420px;height:100px; margin-top:10px; resize: none;' name='comment_contents'> </textarea> </div>");
         $("#comment_list").append("<input id='btn_del"+comment_count+"' type='button' value='댓글 삭제' onclick='reply_del("+comment_count+")'>");
         $("#comment_list").append("<input id='btn_change"+comment_count+"' type='button' value='댓글 수정' onclick='reply_ch("+comment_count+")'>");
         $("#comment_list").append("<input id='btn_change_cel"+comment_count+"' style='display: none' type='button' value='댓글 수정 취소' onclick='reply_ch_cel("+comment_count+")'>");
         $("#comment_list").append("<input type='hidden' id='bno_out"+comment_count+"' value='"+bno_view+"'>");
         
         $("#comment_cancel").css("display","");
         for(i=0;i<comment_count+1;i++){
            $("#btn_change"+i).attr('disabled', "disabled");
            $("#btn_del"+i).attr('disabled', "disabled");
         }
      }else{
         $("#commare"+comment_count).attr('disabled', true);
         $("#comment_btn").val("댓글");
         $("#comment_cancel").css("display","none");
         
         
         
        bi=$("#bno_out"+comment_count).val();
        ci=$("#commare"+comment_count).val();
        wi=$("#comment_writer"+comment_count).text();
        alert(bi);
        alert(ci);
        alert(wi);
         
      $.ajax({
            url : "reply",
            type : "post",
            data : {bno:bi,comnet:ci,writer:wi},
            success : function(result) {
                  r=result;
                  $("#comment_list").append("<input type='hidden' id='rno_out"+comment_count+"' value='"+result+"'>");
            for(i=0;i<comment_count+1;i++){
               $("#btn_change"+i).removeAttr('disabled');
               $("#btn_del"+i).removeAttr('disabled');
            }
            },
            error : function() {
               alert('댓글 입력 실패')
         }
      })
      comment_count++;
      }
   }
     function comment_cel() {
       $("#commare"+comment_count).attr('disabled', false);
       $("div").remove("#canc"+comment_count);
       $("input").remove("#btn_del"+comment_count);
         $("input").remove("#btn_change"+comment_count);
         $("input").remove("#bno_out"+comment_count);
         $("input").remove("#rno_out"+comment_count);
       $("#comment_btn").val("댓글");
       $("#comment_cancel").css("display","none");
      }
   
      function reply_del(d) {
            b='${bno_view}';
            $.ajax({
               url : "replydel",
               type : "post",
               data : {bno:b,rno:$("#rno_out"+d).val()},
               success : function() {
                  $("input").remove("#btn_del"+d);
                  $("input").remove("#btn_change"+d);
                  $("input").remove("#bno_out"+d);
                  $("input").remove("#rno_out"+d);
                  $("div").remove("#canc"+d);
               },
               error : function() {
                  alert('댓글 삭제 실패')
            }
         });
   }
   function reply_ch(d) {
      $("#text").val($("#commare"+d).val());
      b='${bno_view}';
      if($("#btn_change"+d).val()=="댓글 수정"){
         $("#btn_change"+d).val("댓글 수정 완료");
         $("#commare"+d).removeAttr('disabled');
         $("#btn_change_cel"+d).css('display','block');
      }else{
         $.ajax({
               url : "replych",
               type : "post",
               data : {bno:b,rno:$("#rno_out"+d).val(),content:$("#commare"+d).val()},
               success : function() {
                  $("#btn_change"+d).val("댓글 수정");
                 $("#commare"+d).attr('disabled','disabled');
                 $("#btn_change_cel"+d).css('display','none');
               },
               error : function() {
                  alert('댓글 수정 실패')
            }
         });
      }
   }
   function reply_ch_cel(d) {
      $("#commare"+d).val($("#text").val());
      $("#btn_change"+d).val("댓글 수정");
      $("#commare"+d).attr('disabled','disabled');
      $("#btn_change_cel"+d).css('display','none');
   }
</script>
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
      padding: 10px;
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
    .table caption{caption-side: bottom; display: none;}
  
</style>
</head>
<body class="fix-header">
<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
</c:if>
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
                        <a class="profile-pic" href="#"> <img src="resources/plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${sessionScope.id }</b></a>
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
                        <a href="accart" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>구매내역 관리</a>
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
                            <h3 class="box-title">Q & A VIEW</h3>
<!-- 여기서 부터 내용 -->
<div>
					<form method="post" action="update?bno=${view.bno}">
<input type="hidden" value="${view.bno}" name="bno">
   <table class="table">
        
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
          <tbody>
            <tr>
                <th>제목</th>
                <td style="size: 80px;">
                   ${view.title}
                </td>
                <th>조회수</th>
                <td>${view.viewcnt }</td>
            </tr>
            <tr>
                <th id="view_name">작성자</th>
                <td>${view.writer }</td>
                <th>작성시간</th>
                <td>${view.regdate }</td>
            </tr>
            <tr style="height:300px;">
                <th>내용</th>
                <td colspan="3" style="height: 200px; width: 700px;">
                ${view.content}
                </td>
            </tr>
        </tbody>
    </table>
    
    
    
    
    <!-- 목록/수정/삭제 -->
   <div>
    <a href="acboard" id="list" class="btn">목록으로</a>
    <input type="submit" value="수정하기" style="border: 0px; background-color: transparent;" >
    <a href="delete?bno=${view.bno}" class="btn">삭제하기</a>
    </div>
    <input type="button" value="댓글" onclick="comment()" id="comment_btn">
    <input type="button" value="취소" onclick="comment_cel()" id="comment_cancel" style="display: none; margin-left: 10px;">
    
    <div id="comment_list">
    </div>

    </form>
    
 </div>
<input type="hidden" id="text">


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
    <script src="resources/plugins/bower_components/toast-master/js/jquery.toast.js"></script>


</body>


</html>