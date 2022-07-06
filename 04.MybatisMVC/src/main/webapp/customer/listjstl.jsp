<%@page import="customer.CustomerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- JSTL 태그를 이용하기 위한 준비 ↑ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- $ <-동적으로 request에 있는 자원에 접근해서 사용 -->
<%@include file="/include/header.jsp" %>
	<h1>고객 관리 모듈(JSTL)</h1>
	<table class="styled-table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
		</thead>
	<c:forEach items="${list}" var="dto">
	<tbody>
		<tr>
			 <td>${dto.id}</td>
			 <td>${dto.name}</td>
			 <td>${dto.gender}</td>
			 <td>${dto.email}</td>
			 <td>${dto.phone}</td>
		</tr>
	</c:forEach>
	</tbody>
	
	
	
	
	
	
	
	</table>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>