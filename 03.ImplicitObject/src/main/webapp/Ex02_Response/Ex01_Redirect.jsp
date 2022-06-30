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
	
	<!-- 파라메터로 id가 admin 그리고 pw가 admin1234가 들어왔을때만 구글로 가기
			그외에는 현재 페이지를 보여준다.
			
			파라메터를 받는 방법 (Attribute(Servlet, Controller ), url) Fom-x
	 -->
	 
	 
	 
	<!-- 파라메터로 입력받는 방법( Servlet 파일 없이 도메인에 입력) -->
<%-- 	<% --%>
// 		if(request.getParameter("id").equals("admin")){
// 			if(request.getParameter("pw").equals("admin1234")){  
// 				response.sendRedirect("http://www.google.com");
			
<%-- 			}else {%> --%>
<!-- 				<h1>비밀번호가 틀립니다</h1> -->
<%-- 				<%} --%>
<%-- 		}else {%> --%>
<!-- 			<h1>아이디가 틀립니다</h1> -->
<%-- 		<%} --%>
<%-- 		%>   --%>



	<!-- Attribute로 Servlet 파일에서 데이터를 받아 forward하는 방법 -->
	<!-- RequestDispatcher라는 것을 통해서'Forward'방식으로 넘어옴 == attribute -->
	<!-- Attribute는 여러가지 데이터 타입을 넣을수가 있음(Object, ArrayList -->
	<%if(request.getAttribute("id").equals("admin")&& request.getAttribute("pw").equals("admin1234")){  
		
			 response.sendRedirect("http://www.google.com"); 
			
		} %> 
		
	
	<!-- Ex01_Response.java(Servlet, Controller)를 통해서 여기까지 와보기 -->
</body>
</html>