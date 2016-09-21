<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
    <%request.setCharacterEncoding("utf-8"); %>
    <%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
    ShopBookDBBean manager = ShopBookDBBean.getInstance();
    
    int check = manager.managerCheck(id, passwd);
    
    if(check == 1){
    	session.setAttribute("managerId",id);
    	response.sendRedirect("../managerMain.jsp");
    }else if (check==0){ %>
    	<script>
    		alert("비밀번호가 맞지 않습니다.");
    		history.go(-1);
    	</script>
    	<%
    }else {
    	%>
    	<script>
    		alert("해당 아이디가 존재 하지 않습니다.");
    		history.go(-1);
    	</script>
    	<%
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>