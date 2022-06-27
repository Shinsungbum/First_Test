<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 요청방식은 크게 두가지 (GET / POST ) 
			GET : URL에 보낸 파라메터가 그대로 찍힘 (보안x)
			POST : URL에 보낸 파라메터가 공개가 안됨 (보안o) 테스트 x
			요청 => URL로함(Servlet) => servlet => jsp ( Model(데이터) view Controller )
				 => URL로함(jsp페이지로 이동) => jsp
	 -->
	
	<!-- Ex01_Request라는 서블릿을 만들고 요청해보기. -->
	<!-- 인풋타입 텍스트 주고 이름하고 아이디 비밀번호 입력받게만들기 -->
	<h1>겟 방식 요청</h1>
	<form action="../Ex01_Request" method="get">
		이름 : <input type="text" name="name" placeholder="이름 입력"><br>
		아이디 : <input type="text" name="id" placeholder="아이디 입력"><br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호 입력"><br>
		<input type="submit">
	</form>
	<br />

	<h1>포스트 방식 요청</h1>
	<form action="../Ex01_Request" method="post">
		이름 : <input type="text" name="name" placeholder="이름 입력"><br>
		아이디 : <input type="text" name="id" placeholder="아이디 입력"><br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호 입력"><br>
		<input type="submit">
	</form>
	<br />
	
	<h1>페이지 to 페이지</h1>
	<form action="Ex01_RequestResult.jsp" method="get">
		이름 : <input type="text" name="name" placeholder="이름 입력"><br>
		아이디 : <input type="text" name="id" placeholder="아이디 입력"><br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호 입력"><br>
		<input type="submit">
	</form>
	<br />
	
</body>
</html>