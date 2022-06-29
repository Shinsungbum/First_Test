<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	JSP에서 제공하는 내장 객체들을 사용해보기.	
	
 -->
<%--  
<%
	// 페이지 내에서 데이터를 유지함
	pageContext.setAttribute("pageCtx", "SSB_PAGE");
	//요청이 있거나 페이지 전환(forward)시에 데이터를 한번 유지함
	request.setAttribute("req", "SSB_REQ");// attribut != param
			
	session.setAttribute("session", "SSB_SESSION");
	
	application.setAttribute("app", "SSB_APP");
	
%> --%>
 
 <%
 		String pageCtx = (String)pageContext.getAttribute("pageCtx");//param(String) , attribute(Object)
 		String req = (String)request.getAttribute("req");
 		String sSession = (String)session.getAttribute("session");
 		String sApp = (String)application.getAttribute("app");
 
 %>
 
 
 <p>PageContext : <%=pageCtx %></p>
 <p>Request : <%=req %></p>
 <p>Session : <%=sSession %></p>
 <p>Application : <%=sApp %></p>
 
</body>
</html>