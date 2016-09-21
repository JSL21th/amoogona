<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "java.sql.Timestamp, java.util.*, java.io.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String realFolder = ""; // web application ue no zettai  keiro
	String filename="";
	MultipartRequest imageUp = null;
	
	String saveFolder = "imageFile"; // file ga upload suru folder wo sitei suru
	
	String encType ="utf-8";// encoding type
	int maxSize = 5*1024*1024; // max upload dekiru file no size;
	
	// genzai JSP page no web application ue no zettai keiro wo get suru 
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	System.out.println(realFolder);

	try{
		// tensou wo tantou suru component wo dekite file wo tensou suru
		// tensou suru filename wo motteiru object, server no ue no zettai keiro, max upload dekiru filesize, moji code
		// using basic security
		imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		// tensou suru file no jyouhou wo motte print suru tameni array no nakade jyouhou wo input suru 
		Enumeration<?> files = imageUp.getFileNames();

		//file no jyouhou ga areba
		while(files.hasMoreElements()){
			//input tag no attribute ga file to siteiru tag no name attribute value : parameter name
			String name = (String)files.nextElement();
			//server ni save siteiru file name
			filename = imageUp.getFilesystemName(name);
			
		}
	}catch(Exception e){
		
	}
%>
<jsp:useBean id="book" class="ch14.bookshop.master.ShopBookDataBean">

</jsp:useBean>
<%

	String book_kind = imageUp.getParameter("book_kind");
	String book_title = imageUp.getParameter("book_title");
	String book_price = imageUp.getParameter("book_price");
	String book_count = imageUp.getParameter("book_count");
	String author = imageUp.getParameter("author");
	String publishing_com = imageUp.getParameter("publishing_com");
	String book_content = imageUp.getParameter("book_content");
	String discount_rate = imageUp.getParameter("discount_rate");
	String year = imageUp.getParameter("publishing_year");
	String month = ((imageUp.getParameter("publishing_month").length()==1)?("0"):(""))+imageUp.getParameter("publishing_month");
	String day = ((imageUp.getParameter("publishing_day").length()==1)?("0"):(""))+imageUp.getParameter("publishing_day");
	book.setBook_kind(book_kind);
	book.setBook_title(book_title);
	book.setBook_price(Integer.parseInt(book_price));
	book.setBook_count(Short.parseShort(book_count));
	book.setAuthor(author);
	book.setPublishing_com(publishing_com);
	book.setPublishing_date(year+"-"+month+"-"+day);
	book.setBook_content(book_content);
	book.setDiscount_rate(Byte.parseByte(discount_rate));
	book.setReg_date(new Timestamp(System.currentTimeMillis()));
	ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
	bookProcess.insertBook(book);

	//response.sendRedirect("bookList.jsp?book_kind="+book_kind);
	
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