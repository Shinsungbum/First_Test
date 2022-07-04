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
	<h1 style="text-align: center;">상세정보</h1>
	<table class="styled-table">
		
			<tr>
				<th style="background-color: #009879;">번호</th><th><%=dto.getStudent_no()%></th>
			</tr>
			<tr>
				<th style="background-color: #009879">이름</th><th><%=dto.getStudent_name()%></th>
			</tr>
			<tr>
				<th style="background-color: #009879">아이디</th><th><%=dto.getUser_id()%></th>
			</tr>
			<tr>
				<th style="background-color: #009879">패스워드</th><th><%=dto.getUser_pw()%></th>
			</tr>
			<tr>
				<th style="background-color: #009879">캐시</th><th><%=dto.getMoney()%></th>
			</tr>
			<tr>
				<th style="background-color: #009879">업데이트 날짜</th><th><%=dto.getUpdate_ymd()%></th>
			</tr>
			
			<tr>
				<th style="background-color: gray"> 
					<a href="update.st?student_no=<%=dto.getStudent_no()%>&user_id=<%= dto.getUser_id()%>">수정하기</a>
				</th>
				<th style="background-color: gray">
					 <a href="delete.st">삭제하기</a>
				
				</th>
			</tr>
			
			
	</table>




	<%@include file="/include/footer.jsp" %>
</body>
</html>