<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script type="text/javascript">
	var comment_count=0;
	size = ${comment_view.size()};
	writer_view = ${writer_view};
	comment_view = ${comment_view};
	regDate_view = ${regDate_view};
	bno_view=${bno_view};
	$(function() {
		for(i=0;i<size;i++){
			$("#comment_list").append("<div id='canc"+comment_count+"' style='margin-top:20px; width:60%; height:250px;'> 작성자 &nbsp; : &nbsp;<label name='comment_writer'>"+writer_view[i]+"</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성시간 &nbsp;:&nbsp;"+regDate_view[i]+""
					+"<br><textarea id='commare"+comment_count+"' cols='1' style='width:420px;height:200px; margin-top:10px; resize: none;' name='comment_contents'> "+comment_view[i]+"</textarea> </div>");
			$("#comment_list").append("<input type='hidden' id='bno_out"+comment_count+"' value='"+bno_view+"'>")
			$("#commare"+comment_count).attr('disabled', true);
			comment_count++;
		}
	})
	function comment() {
		if($("#comment_btn").val()=='댓글'){
			$("#commare"+comment_count).attr('disabled', false);
			$("#comment_btn").val("등록");
			$("#comment_list").append("<div id='canc"+comment_count+"' style='margin-top:20px; width:60%; height:250px;'> 작성자 &nbsp; : &nbsp;<label id='comment_writer"+comment_count+"'>${id}</label>"
					+"<br><textarea id='commare"+comment_count+"' cols='1' style='width:420px;height:200px; margin-top:10px; resize: none;' name='comment_contents'> </textarea></div>");
			$("#comment_list").append("<input type='hidden' id='bno_out"+comment_count+"' value='"+bno_view+"'>")
			$("#comment_cancel").css("display","");
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
					alert(result)
				},
				error : function() {
					alert('댓글 실패')
				}
			})
			comment_count++;
		}
	}
	function comment_cancel() {
		$("#commare"+comment_count).attr('disabled', false);
		$("div").remove("#canc"+comment_count);
		$("#comment_btn").val("댓글");
		$("#comment_cancel").css("display","none");
	}
</script>


<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
  table {
    width: 60%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
 a { text-decoration:none;  color: #000; !important  } 
a:link { color: #000; text-decoration: none; } <!-- link : 방문전 링크 상태 -->
a:visited {
	color: #000; text-decoration: none; } <!-- visited : 방문후 링크 상태 -->
a:hover { color: #000; text-decoration: none; } <!-- hover : 마우스 오버했을 때 링크 상태 -->
a:active { text-decoration: none; color: #000; } <!-- active : 클릭했을 때 링크 상태 -->
 fieldset {
    border: none;
    vertical-align: top;
}
</style>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div align="center" class="div1">
<form method="post" action="update?bno=${view.bno}">
<input type="hidden" value="${view.bno}" name="bno">
   <table class="board_view">
   		
        
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
                <th>작성자</th>
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
    <div id="comment_list">
    </div>
    <a href="list" id="list" class="btn">목록으로</a>
    <input type="submit" value="수정하기">
<%--      <a href="update?bno=${view.bno}" class="btn">수정하기</a>   --%>
    <a href="delete?bno=${view.bno}" class="btn">삭제하기</a>
    </form>
    <input type="button" value="댓글" onclick="comment()" id="comment_btn">
    <input type="button" value="취소" onclick="comment_cancel()" id="comment_cancel" style="display: none; margin-left: 10px;">
 </div>       
<jsp:include page="../default/footer.jsp"/>
</body>
</html>