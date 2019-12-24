<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1> jsp comment </h1>
	<!-- html -->
	<%-- jsp 주석 --%>
	<ul>
		<%
		//int age = 10;
		for(int i=0; i<100; i++){ 
		out.println("<li>" + i + "</li>");
		}
		%>
		
	</ul>
</body>
</html>