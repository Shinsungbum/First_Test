<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>신규직업추가</h3>



<form method='post' action='insert.jo' enctype='multipart/form-data'>
<input type='hidden' name='writer' value='${loginInfo.userid}'>
<table class='w-px1200'>
<tr><th class='w-px140'>직업종류</th>
	<td><input type='text' class='full chk' name='job_title' title='제목'></td>
</tr>
<tr><th>직무개요</th>
	<td><textarea class='full chk' name='job_overview' title='내용'></textarea></td>
</tr>
<tr><th>수행직무</th>
	<td><textarea class='full chk' name='job_perform' title='내용'></textarea></td>
</tr>
<tr><th>부가직업정보</th>
	<td><textarea class='full chk' name='content' title='내용'></textarea></td>
</tr>

</table>
</form>

<div class='btnSet'>
	<a class='btn-fill' onclick="if( emptyCheck() ) $('form').submit()">저장</a>
	<a class='btn-empty' onclick='location="list.no"'>취소</a>
</div>
</body>
</html>