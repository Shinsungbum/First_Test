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
	<form action="Test02_RequestResult.jsp" method="get">
		<input type="text" placeholder="아이디를 입력하세요" name="id">
		<input type="text" placeholder="비밀번호를 입력하세요" name="pw">
		<input type="submit">
		<!-- 아이디와 비밀번호를 직접만든 서블릿에서 요청받기 -->
	</form>

	<form action="../Test02_Request" method="get">
		<input type="text" placeholder="아이디를 입력하세요" name="id">
		<input type="text" placeholder="비밀번호를 입력하세요" name="pw">
		<input type="submit">
		<!-- 아이디와 비밀번호를 직접만든 서블릿에서 요청받기 -->
	</form>
</body>
</html>