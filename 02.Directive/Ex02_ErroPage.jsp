<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 오류 발생시 이페이지를 실행 -->
	<h1>지금 오류가 발생했습니다.</h1>
	<h2>개발자가 수정중일껍니다. 최대한 빠르게 대응하겠습니다.</h2>
	<!-- JSP 컨테이너(내장객체) exception -->
	<h3>exception 내장 객체 변수를 이용해서 에러를 표시</h3>
	<%
		//out <= 내장객체 나중에 배움
		exception.printStackTrace(new PrintWriter(out));
	%>
	
	
	
</body>
</html>