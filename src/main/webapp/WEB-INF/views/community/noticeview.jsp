<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
 fieldset {
    border: none;
    vertical-align: top;
}
</style>
</head>
<body>
<div class="div1">
<form method="post" action="update?bno=${view.bno}">
<input type="hidden" value="${view.bno}" name="bno">
   <table border="1">
   <caption><font style="font: 400 30px 'Poppins',sans-serif;">Notice<br></font></caption>
<!--     <colgroup> -->
<!--             <col width="15%"> -->
<!--             <col width="35%"> -->
<!--             <col width="15%"> -->
<!--             <col width="*"> -->
<!--         </colgroup> -->
          <tbody>
            <tr>
                <th style="size: 40;">제목</th>
                <td style="size: 100px;">
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
    <input type="button" onclick="location.href='notice'"value="목록">
    </form>
 </div>       

</body>
</html>