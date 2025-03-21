<%@page import="com.test.java.data.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//1. 데이터 가져오기
	//2. DB 작업 > 메모 쓰기(insert)
	//3. 실행 결과 처리
	
	//1.
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String pw   = request.getParameter("pw");
	String memo = request.getParameter("memo");
	
	//2.
	DBUtil util = new DBUtil();
	Connection conn = null;
	PreparedStatement stat = null;
	
	conn = util.open();
	
	String sql = "insert into tblMemo (seq, name, pw, memo, regdate) values (seqMemo.nextVal, ?, ?, ?, default)";
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, name);
	stat.setString(2, pw);
	stat.setString(3, memo);
	
	int result = stat.executeUpdate();
	
	stat.close();
	conn.close();
	
	if (result == 1) {
	    response.sendRedirect("/memo/list.jsp");
	} else {
	    out.println("<script>alert('faild'); history.back();</script>");
	    out.close();
	}
	
	
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Memo</title>
<%@ include file="/inc/asset.jsp"%>
<style>
</style>
</head>
<body>
	<!-- addok.jsp -->
	<%@ include file="/inc/header.jsp"%>

	<h1>
		Memo <small>쓰기</small>
	</h1>

	<% if (result == 1) { %>
	<div class="message">메모 작성을 완료했습니다.</div>
	<div>
		<button type="button" class="back"
			onclick="location.href='/memo/list.jsp';">돌아가기</button>
	</div>
	<% } %>

	<% if (result == 0) { %>
	<div class="message">메모 작성을 실패했습니다.</div>
	<div>
		<button type="button" class="back" onclick="history.back();">돌아가기</button>
	</div>
	<% } %>
	<!-- "history.back();" 뒤로가기와 비슷 // 서버를 들리지 않고 사진찍어둔것 처럼 이전상태 그대로 됨//무조건 "history.back();"을 사용하는건 아니라 선택. (보안) -->




	<script>
		
		<% if (result == 1) { %>
		alert('메모 작성을 완료했습니다.');
		location.href = '/memo/list.jsp';
		<% } %>
		
		<% if (result == 1) { %>
		alert('메모 작성을 실패했습니다.');
		history.back();
		<% } %>
	
	
	
	</script>
</body>
</html>






