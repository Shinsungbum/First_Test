<%@page import="student.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<%StudentDTO dto = (StudentDTO) request.getAttribute("dto"); %>
		<h1 style="text-align: center;">회원정보수정</h1>
		
	<table class="styled-table">

			<tr>
				<th style="background-color: #009879;">학생번호</th>
				<th><input type="text" disabled="disabled" value="<%=dto.getStudent_no()%>" ></th>
			</tr>

			<tr>
				<th style="background-color: #009879">아이디</th>
				<th><input type="text" disabled="disabled" value="<%=dto.getUser_id()%>"></th>
			</tr>
			
			<tr>
				<th style="background-color: #009879">캐시</th>
				<th><input type="text" value="<%=dto.getMoney()%>"></th>
			</tr>
		
			<tr>
				<th style="background-color: #009879">이름</th>
				<th><input type="text" value="<%=dto.getStudent_name()%>"></th>
			</tr>
			
			
			<tr>
				<th style="background-color: #009879">패스워드</th>
				<th><input type="text" value="<%=dto.getUser_pw()%>"></th>
			</tr>
			
			<tr>
				<th>
					<input type="submit" value="수정하기">
				</th>
			</tr>

			
			
	</table>
	<%@include file="/include/footer.jsp" %>
</body>
</html>