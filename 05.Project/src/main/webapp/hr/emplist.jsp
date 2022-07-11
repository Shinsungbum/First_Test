<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/include/layout.jsp"%>
	<div class="container-fluid px-4">
	<h1 class="mt-4">사원조회</h1>
	<div class="card-body">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>사원 번호</th>
					<th>성</th>
					<th>이름</th>
					<th>이메일</th>
					<th>핸드폰</th>
					<th>급여</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.employee_id}</td>
					<td>${dto.last_name}</td>
					<td>${dto.first_name}</td>
					<td>${dto.email}</td>
					<td>${dto.phone_number}</td>
					<td>${dto.salary}</td>
 				</tr>
				
				</c:forEach>
			

			</tbody>
		</table>
	</div>
</div>


<%@ include file="/include/footer.jsp"%>
</body>
</html>