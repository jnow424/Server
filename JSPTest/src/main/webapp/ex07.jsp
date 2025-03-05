<%@page import="com.test.java.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = "홍길동";
    int dan = 5;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- ex07.jsp -->
    <h1>JSP</h1>
    
    <div>안녕하세요. <%= name %>님</div>
    
    <hr>
    
    <% for (int i=1; i<=9; i++) { %>
    <div><%= dan %> x <%= i %> = <%= dan * i %></div>
    <% } %>
    
    <hr>
    
    <div>50 + 60 = <% //= sum(50, 60) %></div>
    
    <% MyUtil util = new MyUtil(); %>
    <div>50 + 60 = <%= util.sum(50, 60) %></div>
    
</body>
</html>












