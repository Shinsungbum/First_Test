<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(request.getParameter("cnt") != null){
		int cnt = Integer.parseInt(request.getParameter("cnt") );
	%>
		

	<form action="../Test02_Request" method="get">
		<!-- 인풋타입 텍스트 주고 이름하고 아이디 비밀번호 입력받게만들기  -->
		<%for (int i = 0 ; i <cnt ; i ++){ %>
		<p>파라메터<%=i %> : <input type="text" name="param<%=i %>" value="param<%=i%>"></p>
		<%} %>
		<input type="text" name="cnt" value="<%=cnt%>">
	<input type="submit">
	</form>	
	<%} %>
</body>
</html>