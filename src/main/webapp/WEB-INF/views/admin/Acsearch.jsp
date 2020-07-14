<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			  title: '아이디를 삭제하시겠습니까?',
			  text: '선택하신 아이디 : '+str+'를 정말 삭제하시겠습니까?',
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
				    	 location.href="DelUser?idval="+str
				    }
			    })
			  }
			})
	});

});
	

</script>
</head>
<body><c:if test="${sessionScope.id.split('_')[0] ne 'admin' }">
<script type="text/javascript">
	alert("관리자만 접근가능합니다")
	location.href="index"
</script>
</c:if>계정조회 페이지<br>
<table align="center" class="table">
                              
   <tr>
      <th></th>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>주소</th>   
      <th>전화번호</th>   
   </tr>
   		<c:set var="doneLoop" value="false"/> 
		<c:forEach var="list" items="${list}">
   <tr>
   <c:choose>
   	<c:when test="${list.id eq 'admin' }">
   		<c:set var="doneLoop" value="true"/> 
   	</c:when>
   	<c:otherwise>
   		<td><input type="checkbox" name="checkBtn"></td>
   		<td>${list.id}</td>
    	<td>${list.pw}</td>
    	<td>${list.name}</td>
    	<td>${list.addr1}&nbsp;${list.addr2 }&nbsp;${list.addr3 }</td>
    	<td>${list.phon}</td>
    	
   	</c:otherwise>
   </c:choose>
   </tr>
   </c:forEach>   
   <tr>
   	<td colspan="6" align="center"><button type="button" id="Delbutton">삭제</button></td>
   </tr>
		
		
</table>

</body>
</html>