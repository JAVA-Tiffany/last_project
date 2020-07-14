<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자)게시판 관리</title>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				    	 location.href="DelBoard?num="+str
				    }
			    })
			  }
			})
	});

});
	

</script>
</head>
<body>
<c:if test="${sessionScope.id.split('_')[0] ne 'admin' }">
<script type="text/javascript">
	alert("관리자만 접근가능합니다")
	location.href="index"
</script>
</c:if>

<div align="center" class="div1">
	<table border="1" class="table">
		<caption><font style="font: 400 30px 'Poppins',sans-serif;">Q/A<br></font></caption>
			<tr>
				<th></th>
				<th style="width: 10%;">번호</th>
				<th style="width: 50%;">제목</th>
				<th style="width: 10%;">작성자</th>
				<th style="width: 10%;">작성일</th>
				<th style="width: 10%;">조회수</th>
			</tr>
			<c:forEach var="adminList" items="${adminList}">
		<tr>
		<td><input type="checkbox" name="checkBtn"></td>
         <td><img src="https://attrangs.co.kr/asset/img/board/icon_notice.png"></td>
          
         <td><a style="text-decoration: none;" class="title" href="view?bno=${adminList.bno}">
         ${adminList.title }</a> </td>
         <td>관리자</td>
         <td style="font-size: 2px;">${adminList.regdate }</td>
         <td>${adminList.viewcnt }</td>
      </tr>
      </c:forEach>
		 <c:forEach var="dto" items="${listAll}">
      <tr>
      	<td><input type="checkbox" name="checkBtn"></td>
         <td>${dto.bno }</td>
         <td>
         <a style="text-decoration: none;" class="title" href="view?bno=${dto.bno}">
         ${dto.title }</a></td>
         <td>${dto.writer }</td>
         <td style="font-size: 2px;">${dto.regdate }</td>
         <td>${dto.viewcnt }</td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5" style="text-align: center;">
            <button type="button" id="Delbutton">글삭제</button>
            <button type="button" onclick="location.href='acboardIns'">글등록</button>
         </td>
      </tr>
   </table>


        <p class="category displaynone"></p>
        <p><select id="search_date" name="search_date">
<option value="week">일주일</option>
<option value="month">한달</option>
<option value="month3">세달</option>
<option value="all">전체</option>
</select> <select id="search_key" name="search_key">
<option value="subject">제목</option>
<option value="content">내용</option>
<option value="writer_name">글쓴이</option>
<option value="member_id">아이디</option>
<option value="nick_name">별명</option>
<option value="product">상품정보</option>
</select> <input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text"  /> 
<a href="#none" onclick="BOARD.form_submit('boardSearchForm');">search</a></p>
</div>
</body>
</html>