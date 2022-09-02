<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 .content {
 width: 1200px;
 margin: 0 auto;
} 

.title{
	width: 1200px;	
	border: 3px solid #CCEEFF ;
	text-align: left;
	margin: 0 auto;
	padding: 20px;
	margin-top: 10px;
	height: 100px;
	font-size: 25px;
}
</style>
</head>
<body>
<h3>직업사전 검색</h3>
<h4 style="color: gray;">직업현장에서의 직무분석을 바탕으로 조사된 직업정보를 한국표준직업분류 기준과 한국표준산업분류 기준으로 확인할 수 있는 대한민국 직업사전입니다</h4>
<div class='title'>${vo.job_title }</div>
<div class='content'>
	<ul class='left'>
		<li>º직무개요</li>
		<li>${vo.job_overview }</li>
	</ul>
	<ul class='left'>
		<li>º수행직무</li>
		<li>${vo.job_perform }</li>
	</ul>
	<ul class='left'>
		<li>º부가직업정보</li>
		<li>${vo.job_overview }</li>
	</ul>
</div>

<div class='btnSet'>
	<a class='btn-fill' onclick="history.go(-1)">목록</a>
	<c:if test='${loginInfo.userid eq vo.writer}'>
	<a class='btn-fill change'>수정</a>
	<a class='btn-fill remove'>삭제</a>
	</c:if>
</div>
</body>
</html>