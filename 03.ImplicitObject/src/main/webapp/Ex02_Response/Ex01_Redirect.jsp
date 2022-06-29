<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Request(요청) Response(응답) -->
	<h1>아이디 비번 틀림</h1>
	
	<!-- 파라메터로 id가 admin 그리고 pw가 admin1234가 들어왔을때만 구글로 가기
			그외에는 현재 페이지를 보여준다.
			
			파라메터를 받는 방법 (Attribute(Servlet, Controller ), url) Fom-x
	 -->
	
	<%if(request.getAttribute("id").equals("admin")){ %>
	
		<%if(request.getAttribute("pw").equals("admin1234")){ %>
		
			<%response.sendRedirect("http://www.google.com");%>
			
		<%} %>
		
	<%} %>
	<!-- Ex01_Response.java(Servlet, Controller)를 통해서 여기까지 와보기 -->
</body>
</html>