<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/jquery-3.2.1.min.js"></script>
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
<script type="text/javascript">
   $(function() {
      $("#btnSave").click(function() {
         var title = $("#title").val();
         var content = $("#smarteditor").val();
         var writer = $("#writer").val();
         if (title == "") {
            swal("제목을 입력하세요");
            document.form1.title.focus();
            return;
         }
         if (content == "") {
            swal("내용을 입력하세요");
            document.form1.content.focus();
            return;
         }
         if (writer == "") {
            swal("이름을 입력하세요");
            document.form1.writer.focus();
            return;
         }
         s={name:$("#name").val(),title:$("#title").val(),content:$("#content").val(),
               infocount:$("#infocount").val(),img:$("#img").val()}
         $.ajax({
            url : "review_save",
            type : "POST",
            data : s,
            success : function(result){
               review_write_form.submit();
            },
            error : function() {
               alert('문제 발생');
            }
         })
      });
   });
</script>

<style type="text/css">
.div1 {
   padding-top: 200px;
   padding-bottom: 100px;
   font: 400 14px 'Poppins', sans-serif;
}

.div2 {
   padding-top: 20px;
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

fieldset {
   border: none;
   vertical-align: top;
}
</style>
</head>
<body>
   <jsp:include page="../default/header.jsp" />
   <div align="center" class="div1">
      <input type="hidden" name="img" id="img" value="${review_img}"> 
      <input type="hidden" name="infocount" id="infocount" value="0">
      <form action="review_save" method="post">
      <table class="board_view">
         <caption>글 작성</caption>
         <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
         </colgroup>
         <tr>
            <th>이름 :</th>
            <td><input name="name" id="name" value="${id}" readonly="readonly"></td>
         </tr>

         <tr>
            <th>제목 :</th>
            <td><input name="title" id="title" size="80"></td>
         </tr>
         
			<tr>
            <th>이미지 :</th>
            <td><input type="file" name="file" id="file" multiple="multiple"></td>
         </tr>
			
         <tr>
            <th>내용 :</th>
            <td><textarea name="content" id="smarteditor" style="height: 200px; width: 700px;"></textarea>
         </tr>

      </table>
      
      <div class="div2">
         <button type="button" id="btnSave">확인</button>
         <button type="reset">취소</button>
      </div>
      </form>
   </div>
   <jsp:include page="../default/footer.jsp" />
   <form action="review" method="post" name="review_write_form">
      <input type="hidden" name="review_text" id="review_text" value="${review_img}">
   </form>
</body>
</html>