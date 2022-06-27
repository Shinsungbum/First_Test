<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 태그를 통해서 DTO같은 객체를 만들어내는 방법 JSP컨테이너 -->
	
	<!-- Form태그안에 inputType=text name=DTO의 필드변수랑 같은것
		찾아서 setter메소드를 실행 후 하나의 dto구조를 만들어냄(자동)
	  -->
	<% UserDTO dto = new UserDTO();
		dto.setName("이름");
		dto.setNum(20); 
	%>
	<!-- DTO필드 == Form태그안에들어있는 inputType위젯 name이 같아야만 자동으로 bean생성해줌※  -->
	<jsp:useBean id="user1" class="dto.UserDTO" />
	<jsp:setProperty property="name" value="이름"  name="user1"/>
	<jsp:setProperty property="num" value="20"  name="user1"/>
	
	<p>자바코드로 DTO생성한것 : <%=dto.getName() %> <%=dto.getNum() %> </p>
	<p>빈객체로 DTO생성한것 : <%=user1.getName() %> <%=user1.getNum() %> </p>
	
	<p>액션태그로 출력(사용빈도x) :<jsp:getProperty property="name" name="user1"/> 
							       <jsp:getProperty property="num" name="user1"/> 
	</p>
	
	
	
	
	
</body>
</html>