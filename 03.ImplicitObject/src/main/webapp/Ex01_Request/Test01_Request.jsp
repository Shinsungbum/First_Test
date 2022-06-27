<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../Test01_Request" method="get">
	<%for(int i = 1; i <= 100; i++) { %>
		<input type="text" name="name<%=i %>" value="na<%=i%>">
	<%} %>
	
	<input type="submit">
	</form>
</body>
</html>