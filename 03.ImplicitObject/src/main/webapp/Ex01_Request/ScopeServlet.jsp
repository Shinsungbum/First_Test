<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<%
	pageContext.setAttribute("pageCtx", "SSB_PAGE");
	request.setAttribute("req", "SSB_REQ");// attribut != param
			
	session.setAttribute("session", "SSB_SESSION");
	
	application.setAttribute("app", "SSB_APP");
	
%>
 
 <form action="../ScopeServlet" method="get">
 	<input type="submit" value="전송">
 </form>
 
 
 
 
 
 
 
 
 
 
</body>
</html>