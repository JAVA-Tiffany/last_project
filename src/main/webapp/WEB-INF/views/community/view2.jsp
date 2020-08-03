<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	textarea {
	width:600px;
	height:100px;
	margin-top:10px;
	resize: none;
	border-bottom: 1px solid #e9e9e9;
	}

.replyWrap{
	width:70%;
}

.replyTitle{
border-top: 1px solid #e9e9e9;
	overflow: hidden;
    padding: 12px 0 10px 20px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
    background-color: #efefef;

}
.replyContent{
	text-align: left;
    clear: both;
    padding: 20px 0 20px 25px;
    word-break: break-all;
    border-bottom: 1px solid #e9e9e9;
}
.textareazone{
	border-color: #efefef;
    background-color: #efefef;
}

.textareazone textarea{
width:700px;
    background-color: white;
}

</style>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/jquery.form.min.js"></script>
<script type="text/javascript">
  
$(document).ready(function() {
	var bno = ${view.bno}; 
	
	$("#insertBtn").click(function(){
		console.log("a");
		var insertData = $("#replyForm").serialize(); //commentInsertForm의 내용을 가져옴
	    commentInsert(insertData); //Insert 함수호출(아래)
	})
	
// 	$("#insertBtn").click(function(){
// 		 var formData = $("#replyForm").serialize();
// 	      $.ajax({
// 	            url : "reply",
// 	            type : "post",
// 	            data : formData,
// 	            success : function(result) {
// 	            	alert(result)
// 	            	alert("댓글 저장 성공")
// // 	            	 reload()
// // 	            	reload();
// // 	            	$('#ajaxdata1').html(data);
// // 	            	location.reload();
// 	            },
// 	            error : function() {
// 	               alert('댓글 입력 실패')
// 	         }
// 	      });
		
		
// 	});
	
	
	function commentList(){
	    $.ajax({
	        url : 'commentlist',
	        type : 'get',
	        data : {'bno':bno},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	                a += '<div class="replyWrap" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="replyTitle">'+' 작성자 : '+value.writer;
	                a += '<a onclick="commentUpdate('+value.rno+',\''+value.content+'\')"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.rno+')"> 삭제 </a> </div>';
	                a += '<div class="commentContent'+value.rno+'"> <p> 내용 : '+value.content +'</p>';
	                a += '</div></div>';

	            });
	            
	            $(".commentList").html(a);
	        }
	    });
	}

	function commentInsert(insertData){
	    $.ajax({
	        url : 'reply',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $("#content").val('');
	            }
	        }
	    });
	}

	function commentUpdate(rno, content){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<textarea cols="1" id="content" name="content_'+rno+'">'+content+'</textarea>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+rno+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentContent'+rno).html(a);
	    
	}
	 
	//댓글 수정
	function commentUpdateProc(rno){
	    var updateContent = $('[name=content_'+rno+']').val();
	    console.log(updateContent)
	    $.ajax({
	        url : 'replyupdate',
	        type : 'post',
	        data : {'content' : updateContent, 'rno' : rno},
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
	        }
	    });
	}
	
	
});

</script>

<script type="text/javascript">
	
	
	
	var bno = ${view.bno}; 
	
	function commentList(){
		
	    $.ajax({
	        url : 'commentlist',
	        type : 'get',
	        data : {'bno':bno},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	            	var recontent = value.content.replace(/\n/gi,"<br>")
	                a += '<div class="replyWrap" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="replyTitle">'+' 작성자 : '+value.writer;
	                a += '<a onclick="commentUpdate('+value.rno+',\''+recontent+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.rno+');"> 삭제 </a> </div>';
	                console.log("리스트쪽 content:"+value.content)
	                a += '<div class="commentContent'+value.rno+'"> <p> 내용 : '+recontent+'</p>';
	                a += '</div></div>';

	            });
	            
	            $(".commentList").html(a);
	        }
	    });
	}

	function commentInsert(insertData){
	    $.ajax({
	        url : 'reply',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            }
	        }
	    });
	}

	function commentUpdate(rno, content){
	    var a ='';
	    console.log(content)
	    var recontent = content.replace(/<br>/gi,"\r\n")
	    console.log(recontent)
	    a += '<div class="input-group">';
	    a += '<textarea cols="1" id="content" name="content_'+rno+'">'+recontent+'</textarea>';
	    a += '<span class="input-group-btn"><button type="button" onclick="commentUpdateProc('+rno+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentContent'+rno).html(a);
	    
	}
	 
	//댓글 수정
	function commentUpdateProc(rno){
	    var updateContent = $('[name=content_'+rno+']').val();
	    console.log(updateContent)
	    $.ajax({
	        url : 'replyupdate',
	        type : 'post',
	        data : {'content' : updateContent, 'rno' : rno},
	        success : function(data){
	            if(data == 1) commentList(); //댓글 수정후 목록 출력 
	        }
	    });
	}


        
     

</script>


<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
font: 400 14px 'Poppins',sans-serif;
}
  table {
    width: 70%;
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
<body onload="commentList()">
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
    <a href="list" id="list" class="btn">목록으로</a>
    <c:if test="${sessionScope.id == view.writer }">
   
    <input type="submit" value="수정하기" style="border: 0px;" >
    <a href="delete?bno=${view.bno}" class="btn">삭제하기</a>
    </c:if>
    </div>
      </form>

    <div class="replyWrap" id="replyWrap">
	    <ul>
	    	<li>
	    		<div class="commentList">
	    		<!-- 여기에 댓글 목록들어간다 -->
	    		</div>
			</li>
			<li>
				<div class="AddReply">
					<!-- 추가되는 댓글 들어갈공간 -->
				</div>
			</li>
	    	
<%-- 	    		<c:forEach var="reply" items="${reply}"> --%>
<!-- 	    	<li> -->
<!-- 			    <div class="replyTitle"> -->
			          
<%-- 			    	<span id="ajaxdata1">${reply.writer }</span><span id="ajaxdata2">${reply.regDate }</span> --%>
			     
<!-- 			     <span><input type="button" value="수정"></span><span><input type="button" value="삭제"></span> -->
<!-- 			    </div> -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 			    <div class="replyContent"> -->
<%-- 			    	<span id="ajaxdata3">${reply.content }</span> --%>
			    
<!-- 			    </div> -->
			   
<!-- 			</li> -->
<%-- 			</c:forEach> --%>
<!-- 			<li> -->
<!-- 				<div class="replyTitle"> -->
<%-- 			    	<span id="ajaxdata1">${reply.writer }</span><span id="ajaxdata2">${reply.regDate }</span> --%>
<!-- 			     <span><input type="button" value="수정"></span><span><input type="button" value="삭제"></span> -->
<!-- 			    </div> -->
<!-- 			</li> -->
			
			<li>
				<div class="replyContentWrap">
					<div class="textareazone">
						<form id="replyForm">
						<div class="input-group">
			               <input type="hidden" name="bno" value="${view.bno}">
			               <input type="hidden" name="writer" value="${view.writer }">
			               
			               <textarea cols="1" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
<!-- 			               <input type="text" id="content" name="content" placeholder="내용을 입력하세요."> -->
			               <span>
			                    <input type="button" id="insertBtn" value="등록"/>
			               </span>
			           </div>

						
<!-- 						<textarea cols="1" name="content"></textarea> -->
<%-- 						<input type="hidden" name="bno" value="${view.bno }"> --%>
<%-- 						<input type="hidden" name="writer" value="${view.writer }"> --%>
<!-- 						<input type="button" id="insertBtn" value="등록"> -->
						</form>
					</div>
					
		
				</div>
			</li>
		</ul>
	</div>
	
	
  
    
 </div>
<input type="hidden" id="text">
<jsp:include page="../default/footer.jsp"/>


</body>
</html>