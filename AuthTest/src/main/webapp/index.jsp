<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		
	</style>
</head>
<body>
	<!-- index.jsp -->
	<h1>시작 페이지</h1>
	
	<div>
		<% if (session.getAttribute("auth") == null) { %>
		<input type="button" value="로그인"
			onclick="location.href='/auth/auth/login.jsp';">
		<% } else { %>
		<input type="button" value="로그아웃"
			onclick="location.href='/auth/auth/logoutok.jsp';">
		<% } %>
	</div>
	
	<hr>
	
	<% if (session.getAttribute("auth") != null) { %>
	<div class="message short" title="개인 정보">
		<div>아이디: <%= session.getAttribute("auth") %></div>
		<div>이름: <%= session.getAttribute("name") %></div>
		<div>등급: <%= ((int)session.getAttribute("lv")) == 1 ? "일반 회원" : "관리자" %></div>
	</div>
	<% } %>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






