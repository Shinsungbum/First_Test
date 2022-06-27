<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 인클루드 태그안에서 param을 전달가능하다(매개변수)  -->
	<jsp:include page="Ex02_Header.jsp">
		<jsp:param value="KYM" name="name"/>
	</jsp:include>
	<h1>JSP인클루드 시키기</h1>
	<jsp:include page="Ex02_footer.jsp"></jsp:include>
</body>
</html>