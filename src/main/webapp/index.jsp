<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.conn.DbConnect,java.sql.Connection" %>
<%@page import="com.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhoneBook</title>
<%-- <script src="https://unpkg.com/@tailwindcss/browser@4"></script> --%>
 <%@include file="component/allCss.jsp" %>
 <style type="text/css">
 .back-img {
   background: url("img/img.jpg");
   width: 100%;
   height: 180vh;
   background-repeat: no-repeat;
   background-size: cover;
 }
 </style>
</head>
<body>
	 <%@include file="component/navbar.jsp" %>
	 
	 
	 
	 <div class="container-fluid back-img text-center text-dark">
	 	<h1 class="mt-2">Welcome to PhoneBook App</h1>
	 </div>

<%@include file="component/footer.jsp" %>
</body>
</html>