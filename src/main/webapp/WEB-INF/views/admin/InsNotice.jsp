<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록 페이지</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript">

var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "smarteditor", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["smarteditor"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
          
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
</head>

<style type="text/css">
.div1 {
padding-top: 200px;
padding-bottom: 100px;
}
.div2{
padding-top: 40px;
}
</style>
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
<script type="text/javascript">
      var size= ${list.size()}
      
      if(size>10){
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
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#Delbutton").click(function(){ 
		var rowData = new Array(); 
        var tdArr = new Array();
        var checkbox = $("input[name=checkBtn]:checked");

	checkbox.each(function(i) {
        var tr = checkbox.parent().parent().eq(i);
        var td = tr.children();
       
        rowData.push(tr.text());
        var userid = td.eq(1).text()+" ";
        tdArr.push(userid);
                
   		 });
		var str = ""
		for(var i=0; i<tdArr.length; i++) {
			console.log(tdArr[i])
			str +=tdArr[i]
		}
		
		Swal.fire({
			  title: '게시글을 삭제하시겠습니까?',
			  text: '선택하신 게시물 : '+str+'를 정말 삭제하시겠습니까?',
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
				    	 location.href="DelNotice?num="+str
				    }
			    })
			  }
			})
	});

});
	

</script>
</head>
<body><c:if test="${sessionScope.id ne 'admin' }">
<script type="text/javascript">
	alert("관리자만 접근가능합니다")
	location.href="index"
</script>
</c:if>



<div align="center" class="div1">
	<form id="frm" action="save_Notice" method="post">
	  <table class="table">
	  
	   <caption>글 작성</caption>
	        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
	
	<tr>
		<th>제목 :</th>
		<td>
		<input type="text" name="title" id="title" size="80">
		</td>
	</tr>
	
	<tr>
		<th>내용 :</th>
		<td>
		<textarea name="content" id="smarteditor" style="height:200px;width: 700px;"></textarea>
	</tr>

	</table>
	<div class="div2">
		<input type="button" id="save" value="저장"/>
		<button type="reset">취소</button>
	</div>
	</form>
</div>
</body>
</html>