<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//1. 인증 티켓 삭제
	
	//session.removeAttribute("auth"); //로그아웃
	//session.removeAttribute("name");
	//session.removeAttribute("lv");
	
	session.invalidate();
	
	response.sendRedirect("/auth/index.jsp");

%>
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
	<!-- logoutok.jsp -->
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






