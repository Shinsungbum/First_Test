<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border= "1px solid black";>
		<%for(int i = 2 ; i<10; i ++){ %>
			<tr>
				<%for(int j = 1 ; j<10; j ++){ %>
				<td> <%=i %> * <%=j %> = <%=i*j %></td>
				<%} %>
			</tr>
		<%} %>
	</table>
	
	
	<table border= "1px solid black";>
		<%for(int i = 1 ; i<10; i ++){ %>
			<tr>
				<%for(int j = 2 ; j<10; j ++){ %>
				<td> <%=j %> * <%=i %> = <%=i*j %></td>
				<%} %>
			</tr>
		<%} %>
	</table>
	
		<table border= "1px solid black";>
		<%for(int i = 1 ; i<10; i ++){ %>
			<tr>
				<%for(int j = 2 ; j<10; j ++){ %>
				<td style="background: #123456;"> <%=j %> * <%=i %> = <%=i*j %></td>
				<%} %>
			</tr>
		<%} %>
	</table>
	
	
	
</body>
</html>