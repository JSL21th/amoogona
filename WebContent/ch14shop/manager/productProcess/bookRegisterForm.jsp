<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../../../etc/color.jspf" %>
<%
String managerId = "";
try{
	managerId=(String)session.getAttribute("managerId");
	if(managerId==null||managerId.equals("")){
		response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../../etc/style.css" rel=stylesheet type = "text/css" />
<script type="text/javascript" src = "../../../etc/script.js">
</script>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>책등록</p>
<br>
<form name = writeform method = post action = bookRegisterPro.jsp enctype="multipart/form-data">
<table>
 <tr>
 	<td align=right colspan=2 bgcolor="<%=value_c%>"><a href = "../managerMain.jsp">관리자 멩ㄴ으로</a></td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">분류선택</td>
 	<td width=400 align=left>
 		<select name = "book_kind">
 			<option value = 100> 문학 </option>
 			<option value = 200> 외국어 </option>
 			<option value = 300> 컴퓨타 </option>
 		</select>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">제목</td>
 	<td width=400 align=left>
 		<input type = text size=50 name = book_title>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">가격</td>
 	<td width=400 align=left>
 		<input type = text size=10 name = book_price> 원
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">수량</td>
 	<td width=400 align=left>
 		<input type = text size=10 name = book_count> 권
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">저자</td>
 	<td width=400 align=left>
 		<input type = text size=20 name = author>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">출판사</td>
 	<td width=400 align=left>
 		<input type = text size=20 name = publishing_com>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">출판일</td>
 	<td width=400 align=left>
 		<select name = publishing_year>
 			<%
 				Timestamp nowTime= new Timestamp(System.currentTimeMillis());
 				int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
 				for (int i = lastYear;i>(lastYear-50);i--){
 					%>
 					<option value = "<%=i%>"><%=i %></option>
 					<%
 				} 
 			%>
 		</select>
 		
 		<select name = publishing_month>
 			<%
 				int lastMonth = Integer.parseInt(nowTime.toString().substring(5,7));
 				for (int i = 1;i<=12;i++){
 					%>
 					<option value = "<%=i%>" <%if(i==lastMonth){ %>selected<%} %>><%=i %></option>
 					<%
 				} 
 			%>
 		</select>
 		<select name = publishing_day>
 			<%
 				for (int i = 1;i<=(31);i++){
 					%>
 					<option value = "<%=i%>" ><%=i %></option>
 					<%
 				} 
 			%>
 		</select>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">이미지</td>
 	<td width=400 align=left>
 		<input type = file name = book_image>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">내용</td>
 	<td width=400 align=left>
 		<textarea name = book_content rows=13 cols=40>
 		</textarea>
 	</td>
 </tr>
 <tr>
 	<td width=100 bgcolor="<%=value_c%>">할인율</td>
 	<td width=400 align=left>
 		<input type = text size=25 name = discount_rate>
 	</td>
 </tr>
 <tr>
 	<td colspan=2 bgcolor="<%=value_c%>" align=cnter>
  		<input type = button value = "책등록" onclick ="checkForm(this.form)">
 		<input type = reset value = "재입력" />
  	</td>
 	
 </tr>
</table>
</form>
</body>
</html>
<%
	}
}catch(Exception e){
	
}%>