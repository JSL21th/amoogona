<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../etc/color.jspf" %>    
    <%
    String managerId="";
    try{
    	managerId = (String)session.getAttribute("managerId");
    	if(managerId==null||managerId.equals("")){
    		response.sendRedirect("logon/managerLoginForm.jsp");
    	}else{
    		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = post action = "./logon/managerLogout.jsp">
<b>칸리자겁중</b>
<input type = submit value = "logout">
</form>
<table>
	<tr>
		<td align="center" bgcolor = "<%=bar%>">상품관련 자료</td>
	</tr>
	<tr>
		<td><a href = "productProcess/bookRegisterForm.jsp">상품 등록</a></td>
	</tr>
	<tr>
		<td><a href = "productProcess/bookList.jsp?book_kind=all">상품 수정/삭제</a></td>
	</tr>
</table>
	<br><Br>
	<table>
		<tr>
			<td align=center bgcolor="<%=bar%>">구매된 상품 관련작업</td>
		</tr>
		<tr>
			<td><a href = "orderedProduct/orderedList.jsp">전체 구매목록 확인</a></td>
		</tr>
	</table>
</body>
</html>
    		
    		<%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>
