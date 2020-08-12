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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
   var fileimg_list=${fileimg};
   var newfileimg_list=[];
   var img_next_count=0;
      function img_next(d) {
         if(newfileimg_list[0]==undefined){
            if(d=='+'){
               parseInt(img_next_count+=1);
                  if(fileimg_list.length==img_next_count){
                  img_next_count=0;
               }
            }
            else if(d=='-'){
               parseInt(img_next_count-=1);
               if(-1==img_next_count){
                  img_next_count=fileimg_list.length-1;
               }
            }
            alert(img_next_count)
            $("#review_write_img_src").attr("src", fileimg_list[img_next_count]);
         }else{
            if(d=='+'){
               parseInt(img_next_count+=1);
                  if(newfileimg_list.length==img_next_count){
                  img_next_count=0;
               }
            }
            else if(d=='-'){
               parseInt(img_next_count-=1);
               if(-1==img_next_count){
                  img_next_count=newfileimg_list.length-1;
               }
            }
            alert(img_next_count)
            $("#review_write_img_src").attr("src", newfileimg_list[img_next_count]);
         }
      }
   $(function() {
      if(fileimg_list.length>=2){
         $("#fileimg_text").val("파일 "+fileimg_list.length+"개");
         $("#review_write_img_src").attr("src", fileimg_list[0]);
      }else if(fileimg_list.length>=1){
         $("#fileimg_text").val(fileimg_list[0].split("/")[2]);
         $("#review_write_img_src").attr("src", fileimg_list[0]);
      }
      $("#btnSave").click(function() {
         var title = $("#title").val();
         var content = $("#content").val();
         var writer = $("#writer").val();
         var form =$("#FormData")[0];
         var data = new FormData(form);
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
//          s={name:$("#name").val(),title:$("#title").val(),content:$("#smarteditor").val(),
//                infocount:$("#infocount").val(),img:$("#img").val(), fileimg:$("#fileimg").val()}
         $.ajax({
            url : "review_save",
            enctype : 'multipart/form-data',
            type : "POST",
            data : data,
            contentType: false,
            processData: false,
            success : function(data){
               location.href='index';
            },
            error : function() {
               alert('문제 발생');
            }
         });
      });
   });
   function file_btn() {
      if('${in_ch}'=='리뷰수정'){
      Swal.fire({
              title: '사진을 변경하시겠습니까?',
              text: '사진을 변경하시겠습니까?',
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, Change it!'
         }).then((result) => {
              if (result.value) {
                Swal.fire({
                   title:'Change!',
                   text: '변경후 수정완료를 클릭 하시면 기존에 등록한 사진은 모두 사라지고 \n 새로 추가한 사진으로 변경됩니다.\n 만약 취소를 누르면 이전에 있던 사진을 가지고 있습니다.\n취소를 누르면 수정되지 않습니다.',
                   icon: 'success',preConfirm:function(){
                      $("#fileimg").click();
                   }
                });
              }
            });
      }else{
         $("#fileimg").click();
      }
      
   }
   function file_onchange(obj) {
      if($("#fileimg")[0].files.length!=0){
         if($("#fileimg")[0].files.length>=2){
            $("#fileimg_text").val("사진 "+$("#fileimg")[0].files.length+"개");
         }else{
            $("#fileimg_text").val($("#fileimg")[0].files[0].name);
         }
         
         var filesArray=Array.prototype.slice.call(obj.files);
         
         filesArray.forEach(function(f) {
            var reader = new FileReader();
            reader.onload = function (e) {
               newfileimg_list.push(e.target.result);
                $("#review_write_img_src").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
         });
         $("#file_btn1").val("사진재수정");
               
      }
   }
   
</script>

<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->


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
   width: 800px;
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
      <form action="review" method="post" enctype="multipart/form-data"
         id="FormData">
         <input type="hidden" name="img" id="img" value="${review_img}">
         <input type="hidden" name="infocount" id="infocount" value="0">
         <input type="hidden" name="pay_rno" id="pay_rno" value="${pay_rno}">
         <input type="hidden" name="type" id="type" value="${type}">
         <input type="hidden" name="rno" value="${rno}">
         <input type="hidden" name="in_ch" value="${in_ch}">
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
               <td colspan="2">
                    <input name="name" id="name" value="${id}" readonly="readonly"> 
                    <c:choose>
                       <c:when test="${in_ch=='리뷰수정'}">
                          <input type="button" value="사진수정" onclick="file_btn()" style="margin-left: 180px;" id="file_btn1">
                       </c:when>
                       <c:otherwise>
                          <input type="button" value="사진선택" onclick="file_btn()" style="margin-left: 180px;" id="file_btn2">
                       </c:otherwise>
                    </c:choose>
                    
                  <input type="text" id="fileimg_text" name="fileimg_text" readonly="readonly" style="width: 200px;">
               </td>
            </tr>

            <tr>
               <th>제목 :</th>
               <td colspan="2"><input name="title" id="title" size="80" value="${title}"></td>
            </tr>

            <tr>
               <th>내용 :</th>
               <td><textarea name="content" id="content" style="height: 200px; width: 450px;resize: none;">${content}</textarea>
               </td>
               <td>
                  <div style="font-size: 15px;" align="center">선택 사진</div>
                  <div style="border: 1px solid black; display: flex;flex: row;">
                        <label onclick="img_next('-')" style="font-size: 40px; cursor: pointer;padding-top: 55px;"><</label>
                        <img style="width: 180px; height: 180px;"id="review_write_img_src">
                        <label onclick="img_next('+')" style="font-size: 40px; cursor: pointer;padding-top: 55px;">></label>
                  </div>
               </td>
            </tr>
         
         </table>
         <input type="file" name="fileimg" id="fileimg" multiple="multiple" style="display: none;" onchange="file_onchange(this)">
         <div class="div2">
            <button type="button" id="btnSave">확인</button>
            <button type="button" onclick="location.href='orderList'">취소</button>
         </div>
      </form>
   </div>
   <jsp:include page="../default/footer.jsp" />
   <form action="review" method="post" name="review_write_form">
      <input type="hidden" name="review_text" id="review_text"
         value="${review_img}">
   </form>

   
</body>
</html>