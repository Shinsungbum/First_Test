<%@page import="employee.EmployeeDTO"%>
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
	<%@ include file="/include/header.jsp"%>
	<h1 style="text-align: center;">사원정보를 보여 줍니다</h1>
	<table class="styled-table">
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>이메일</th>
				<th>부서코드</th>
				<th>전화번호</th>
				<th>부서명</th>
				<th>주소</th>
				<th>부서최대급여</th>
				<th>부서최소급여</th>
				<th>부서평균급여</th>
			</tr>
		</thead>
		<tbody>
			<%
		ArrayList<EmployeeDTO> list = (ArrayList<EmployeeDTO>)request.getAttribute("list");
		for(int i = 0 ;  i<list.size(); i ++){
	%>
			<tr>
				<td><%=list.get(i).getEmployee_id()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getE_mail()%></td>
				<td><%=list.get(i).getDepartment_id()%></td>
				<td><%=list.get(i).getPhone_number()%></td>
				<td><%=list.get(i).getDepartment_name()%></td>
				<td><%=list.get(i).getAddr()%></td>
				<td><%=list.get(i).getMax_sal()%></td>
				<td><%=list.get(i).getMin_sal()%></td>
				<td><%=list.get(i).getAvg_sal()%></td>
			</tr>
			
			<%} %>
		</tbody>
	</table>
	<%@ include file="/include/footer.jsp"%>
</body>
</html>