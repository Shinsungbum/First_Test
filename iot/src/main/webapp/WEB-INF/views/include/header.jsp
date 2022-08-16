<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<header>
<div class='category'>
	<ul>
		<li><a href="<c:url value='/'/>"><img src='img/hanul.logo.png'></a></li>
		<li><a ${category eq 'cu' ? 'class="active"' : ''} href='list.cu'>고객관리</a></li>
		<li><a ${category eq 'hr' ? 'class="active"' : ''} href='list.hr'>사원관리</a></li>
		<li><a ${category eq 'no' ? 'class="active"' : ''} >공지사항</a></li>
		<li><a ${category eq 'bo' ? 'class="active"' : ''} >방명록</a></li>
		<li><a ${category eq 'da' ? 'class="active"' : ''} >공공데이터</a></li>
		<li><a ${category eq 'vi' ? 'class="active"' : ''} >시각화</a></li>
	</ul>
</div>
<div>
	<ul>
		<!-- 로그인하지 않은 경우 --> 
		<c:if test="${empty loginInfo }">
		<li><a class='btn-fill' href='login'>로그인</a></li>
		<li><a class='btn-fill' >회원가입</a></li>
		</c:if>
		
		<!-- 로그인한 경우 -->
		<c:if test="${not empty loginInfo }">
		<li>${loginInfo.name} 님 <a class='btn-fill'>로그아웃</a></li>
		</c:if>
	</ul>
</div>
</header>
<style>
header { 
	border-bottom:1px solid #ccc;
	display: flex; 
	justify-content: space-between;
	/* width: calc(100% - 200px); */
	padding: 0 100px;
	align-items: center;
}
header div.category ul { display: flex; font-weight: bold;  }
header div.category ul li:not(:last-child) { margin-right: 50px }
header div.category ul li a:hover
, header div.category ul li a.active { color: #0040ff; }
header div ul {display: flex;}
header div ul li:not(:last-child) { margin-right: 5px}

a { cursor: pointer; }

</style>
<link rel='stylesheet' type='text/css' 
	href='css/common.css?<%=new java.util.Date()%>'>

