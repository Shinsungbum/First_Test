<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>성공</h1>
	<%
		Cookie[] cookies = request.getCookies();//배열로 들어있음
		for(int i = 0; i < cookies.length; i++){
		%>
		<p>name : <%=cookies[i].getName() %></p>	
		<p>Value : <%=cookies[i].getValue() %></p>	
	<%	}
	%>
</body>
</html>