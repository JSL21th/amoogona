<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	input {
		ime-mode:inactive;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 폼</h2>
<form method="post" action ="managerLoginPro.jsp">
	아이디 : <input type = text name = id maxlength=50 ><br>
	비밀번호 : <input type = password name =passwd maxlength=16 ><br>
	<input type = submit value = '간리자로긴'>
</form>
</body>
</html>