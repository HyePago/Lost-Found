<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	
	// request
	String select = request.getParameter("select");
	String searchText = request.getParameter("searchText");
	
	out.println(select);
	out.println(searchText);
%>