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
	<!-- auth > login.jsp -->
	<h1>로그인</h1>
	
	<form method="POST" action="/auth/auth/loginok.jsp">
	<table class="vertical content">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" required class="short"></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="pw" required class="short"></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="로그인">
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






