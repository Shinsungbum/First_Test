<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
width: 1200px;	
}

table td {
border : none;
border-bottom: 1px solid gray;

}

.text-gray {
color: gray;
}

</style>
</head>
<body>
<h1>직업사전 검색</h1>
<form method="post">
<c:forEach items="${list }" var='vo'>
<table class='left'>
<tr>
	<td>
		<a onclick="detail(${vo.id})">${vo.job_title }</a>
		<br />
		<br />
		<span class='text-gray'>${vo.job_overview }</span>
	</td>
</tr>

</table>
</c:forEach>
<input type="hidden" name='id'>
</form>
<script type="text/javascript">
function detail(id) {
	$('[name=id]').val( id );
	$('form').attr('action', 'detail.jo');
	$("form").submit();
}
</script>
</body>
</html>