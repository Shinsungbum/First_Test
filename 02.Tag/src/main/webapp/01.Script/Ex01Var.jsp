<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 전역변수 만들어보기 ( String 변수 하나 만들기 , double 변수, String[] 배열 4개이상의 크기 (배열내용 T, E, S, T)-->
	<%! int vInt = 0;
		String str = "SSB";
		double dou = 25.6;
		String[] arrstr = {"T", "E", "S", "T"};
	
	%>
	<!-- 지역변수 -->
	<% int lvInt = 10; 
		vInt ++;
		lvInt ++;
	
	%>
	
	<!-- 전역변수 표현해보기 -->
	<p>vint의 값 <%=vInt %> lvInt에 값<%=lvInt %></p>
	
	
	
	
	<p>str의 값 <%=str %></p>
	<p>dou의 값 <%=dou %></p>
	<p>arrstr의 값 <%=arrstr[0]  %>,<%=arrstr[1] %>,<%=arrstr[2] %>,<%=arrstr[3] %></p> <!-- 배열은 인덱스번지를 찾아가야 답이나옴 -->
</body>
</html>