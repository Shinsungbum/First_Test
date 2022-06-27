<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 전역변수 만들어보기   (String 변수 하나 만들기 , double 변수 , String[] 배열 4개이상의 크기 (배열내용 T , E ,S,T)-->
	<%! int vInt = 3;
		String vStr = "아무글씨";
		double vDouble = 11.1;
		String[] arr = { "T" , "E" , "S" , "T" } ;
				
	%>
	<!-- 지역 변수  -->
	<% int lvInt = 10; 
		vInt ++ ;
		lvInt ++;
	%>

	<!-- 전역변수 표현해보기 -->
	<p>vInt에 값 <%=vInt%>  lvInt에 값 <%=lvInt %></p>
	
	
	<p>vStr에 값 <%=vStr%></p>
	<p>vDouble에 값 <%=vDouble%></p>
	<p>arr[0]에 값 <%=arr[0]%><%=arr[1]%><%=arr[2]%><%=arr[3]%></p>
	<p>arr[1]에 값 <%=arr[1]%></p>
	<p>arr[2]에 값 <%=arr[2]%></p>
	<p>arr[3]에 값 <%=arr[3]%></p>
	
</body>
</html>